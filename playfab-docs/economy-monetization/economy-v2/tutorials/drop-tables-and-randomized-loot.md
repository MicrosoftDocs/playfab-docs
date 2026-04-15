---
title: Drop tables and randomized loot in Economy v2
author: ernestoc
description: How to implement weighted random loot tables in Economy v2 using Azure Functions and ExecuteInventoryOperations
ms.author: ernestoc
ms.date: 02/23/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy, drop tables, loot, random, gacha, azure functions
ms.localizationpriority: medium
---

# Drop tables and randomized loot

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Economy v1 (Legacy) had a built-in [Drop Tables](../../economy/tutorials/drop-tables.md) feature that let you define weighted random item distributions directly in Game Manager. Economy v2 doesn't include drop tables as a native feature, but you can implement the same behavior—and with more flexibility—using [Azure Functions](/azure/azure-functions/functions-overview) combined with the [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations) API.

This tutorial shows you how to build a complete randomized loot system that:

- Defines loot tables with weighted item pools in [Title Data](../../../live-service-management/game-configuration/titledata/index.md).
- Uses an Azure Function to roll random items from a loot table.
- Atomically subtracts a container token and grants the randomly selected items in a single call.

## How it works

1. **Define loot tables in Title Data**: Store your drop table configurations (item IDs, weights, quantities) as JSON in Title Data so you can update them without redeploying code.
2. **Represent containers as virtual currency**: Use the same [container token pattern](containers-with-fixed-contents.md) as fixed-contents containers: a virtual currency that acts as an unopened loot box.
3. **Call an Azure Function to open the container**: The function reads the loot table, runs weighted random selection, then calls `ExecuteInventoryOperations` to atomically subtract 1 container token and add the randomly selected items.

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- A title created in [Game Manager](https://developer.playfab.com/).
- Published catalog items that you can grant as loot rewards.
- A virtual currency representing the container (see [Containers with fixed contents](containers-with-fixed-contents.md#step-1-create-a-virtual-currency-for-the-container) for setup instructions).
- An [Azure Functions](../../../live-service-management/service-gateway/automation/cloudscript-af/quickstart.md) project connected to your PlayFab title.

## Step 1: Define loot tables in Title Data

Store your loot table definitions in [Title Data](../../../live-service-management/game-configuration/titledata/index.md) so designers can update drop rates without code changes.

### Example loot table structure

Create a Title Data key called `LootTables` with a JSON value:

```json
{
  "TreasureChest": {
    "Rolls": 1,
    "Items": [
      { "ItemId": "{{CommonSwordID}}", "Weight": 1000, "MinQuantity": 1, "MaxQuantity": 1 },
      { "ItemId": "{{UncommonSwordID}}", "Weight": 100, "MinQuantity": 1, "MaxQuantity": 1 },
      { "ItemId": "{{RareSwordID}}", "Weight": 10, "MinQuantity": 1, "MaxQuantity": 1 },
      { "ItemId": "{{LegendarySwordID}}", "Weight": 1, "MinQuantity": 1, "MaxQuantity": 1 }
    ]
  },
  "SupplyCrate": {
    "Rolls": 3,
    "Items": [
      { "ItemId": "{{HealthPotionID}}", "Weight": 50, "MinQuantity": 1, "MaxQuantity": 5 },
      { "ItemId": "{{ManaPotionID}}", "Weight": 50, "MinQuantity": 1, "MaxQuantity": 3 },
      { "ItemId": "{{GoldCurrencyID}}", "Weight": 80, "MinQuantity": 10, "MaxQuantity": 100 },
      { "ItemId": "{{RareGemID}}", "Weight": 5, "MinQuantity": 1, "MaxQuantity": 1 }
    ]
  }
}
```

Each loot table includes the following properties:

| Property | Description |
|---|---|
| **Rolls** | How many times to roll on the table when the container is opened. |
| **Items** | The pool of possible rewards, each with a weight and quantity range. |
| **Weight** | Relative probability. A higher weight means the item is more likely to drop. |
| **MinQuantity / MaxQuantity** | Range of how many of that item to grant per roll. |

### Setting Title Data

#### [Game Manager](#tab/title-data-gm)

1. Go to **Content** > **Title Data**.
2. Create a key called `LootTables`.
3. Paste your JSON loot table configuration as the value.
4. Select **Save**.

#### [API](#tab/title-data-api)

Use [SetTitleData](/rest/api/playfab/server/title-wide-data-management/set-title-data):

```json
{
  "Key": "LootTables",
  "Value": "{\"TreasureChest\":{\"Rolls\":1,\"Items\":[...]}}"
}
```

---

## Step 2: Create the Azure Function

Create an Azure Function that your game client calls when a player wants to open a container. The function:

1. Verifies the player has at least one container token.
2. Reads the loot table from Title Data.
3. Runs weighted random selection.
4. Calls `ExecuteInventoryOperations` to atomically subtract the token and grant the rewards.

### Data models

```csharp
public class OpenContainerRequest
{
    public string LootTableId { get; set; }  // e.g., "TreasureChest"
}

public class LootTable
{
    public int Rolls { get; set; }
    public List<LootTableEntry> Items { get; set; }
}

public class LootTableEntry
{
    public string ItemId { get; set; }
    public int Weight { get; set; }
    public int MinQuantity { get; set; }
    public int MaxQuantity { get; set; }
}
```

### Weighted random selection

```csharp
public static LootTableEntry RollOnTable(LootTable table, Random rng)
{
    int totalWeight = table.Items.Sum(e => e.Weight);
    int roll = rng.Next(0, totalWeight);

    int cumulative = 0;
    foreach (var entry in table.Items)
    {
        cumulative += entry.Weight;
        if (roll < cumulative)
            return entry;
    }

    // Fallback (shouldn't reach here)
    return table.Items.Last();
}
```

### Full Azure Function

```csharp
[FunctionName("OpenLootContainer")]
public static async Task<dynamic> Run(
    [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
    ILogger log)
{
    // 1. Parse the PlayFab context and request
    var context = JsonConvert.DeserializeObject<FunctionExecutionContext<dynamic>>(
        await req.ReadAsStringAsync());
    var args = context.FunctionArgument != null
        ? JsonConvert.DeserializeObject<OpenContainerRequest>(
            context.FunctionArgument.ToString())
        : null;

    if (args == null || string.IsNullOrEmpty(args.LootTableId))
        return new { Error = "LootTableId is required." };

    var playerEntity = context.CallerEntityProfile.Entity;
    var settings = new PlayFabApiSettings
    {
        TitleId = context.TitleAuthenticationContext.Id,
        DeveloperSecretKey = Environment.GetEnvironmentVariable("PLAYFAB_DEV_SECRET_KEY")
    };
    var authContext = new PlayFabAuthenticationContext
    {
        EntityToken = context.TitleAuthenticationContext.EntityToken
    };

    var serverApi = new PlayFabServerInstanceAPI(settings);
    var economyApi = new PlayFabEconomyInstanceAPI(settings, authContext);

    // 2. Read the loot table from Title Data
    var titleDataResult = await serverApi.GetTitleDataAsync(new GetTitleDataRequest
    {
        Keys = new List<string> { "LootTables" }
    });

    if (!titleDataResult.Result.Data.ContainsKey("LootTables"))
        return new { Error = "LootTables not found in Title Data." };

    var allTables = JsonConvert.DeserializeObject<Dictionary<string, LootTable>>(
        titleDataResult.Result.Data["LootTables"]);

    if (!allTables.ContainsKey(args.LootTableId))
        return new { Error = $"Loot table '{args.LootTableId}' not found." };

    var lootTable = allTables[args.LootTableId];

    // 3. Roll for rewards
    var rng = new Random();
    var rewards = new Dictionary<string, int>(); // ItemId -> total quantity

    for (int i = 0; i < lootTable.Rolls; i++)
    {
        var entry = RollOnTable(lootTable, rng);
        int quantity = rng.Next(entry.MinQuantity, entry.MaxQuantity + 1);

        if (rewards.ContainsKey(entry.ItemId))
            rewards[entry.ItemId] += quantity;
        else
            rewards[entry.ItemId] = quantity;
    }

    // 4. Build the atomic operation: subtract 1 container token + add rewards
    var operations = new List<InventoryOperation>();

    // Subtract the container token
    // The container currency ID must match the LootTableId mapping
    // Store this mapping in Title Data or use a naming convention
    operations.Add(new InventoryOperation
    {
        Subtract = new SubtractInventoryItemsOperation
        {
            Item = new InventoryItemReference
            {
                Id = GetContainerCurrencyId(args.LootTableId) // Your mapping logic
            },
            Amount = 1
        }
    });

    // Add each reward
    foreach (var reward in rewards)
    {
        operations.Add(new InventoryOperation
        {
            Add = new AddInventoryItemsOperation
            {
                Item = new InventoryItemReference { Id = reward.Key },
                Amount = reward.Value
            }
        });
    }

    // 5. Execute atomically
    var executeResult = await economyApi.ExecuteInventoryOperationsAsync(
        new ExecuteInventoryOperationsRequest
        {
            Entity = new EntityKey
            {
                Id = playerEntity.Id,
                Type = playerEntity.Type
            },
            Operations = operations,
            IdempotencyId = Guid.NewGuid().ToString()
        });

    if (executeResult.Error != null)
    {
        log.LogError($"Failed to execute operations: {executeResult.Error.ErrorMessage}");
        return new { Error = executeResult.Error.ErrorMessage };
    }

    log.LogInformation($"Player {playerEntity.Id} opened {args.LootTableId}, received: " +
        string.Join(", ", rewards.Select(r => $"{r.Value}x {r.Key}")));

    return new { Rewards = rewards, TransactionIds = executeResult.Result.TransactionIds };
}
```

> [!NOTE]
> The `GetContainerCurrencyId` helper function maps a loot table name to its corresponding container currency ID. You can store this mapping in Title Data alongside the loot tables, or use a naming convention.

## Step 3: Grant container tokens to players

Grant container tokens to players through gameplay, store purchases, or rewards. Use the same approach described in [Containers with fixed contents](containers-with-fixed-contents.md#step-3-grant-container-tokens-to-players).

## Step 4: Call the function from your game client

When the player wants to open a container, call the Azure Function by using [ExecuteFunction](/rest/api/playfab/cloudscript/server-side-cloud-script/execute-function):

```json
{
    "FunctionName": "OpenLootContainer",
    "FunctionParameter": {
        "LootTableId": "TreasureChest"
    },
    "GeneratePlayStreamEvent": true
}
```

The response contains the randomly selected rewards:

```json
{
    "FunctionResult": {
        "Rewards": {
            "{{UncommonSwordID}}": 1
        },
        "TransactionIds": ["txn-abc-123"]
    }
}
```

## Loot table design patterns

### Rarity tiers

The classic rarity system with exponentially decreasing weights:

```json
{
  "Items": [
    { "ItemId": "CommonItem",     "Weight": 1000, "MinQuantity": 1, "MaxQuantity": 1 },
    { "ItemId": "UncommonItem",   "Weight": 100,  "MinQuantity": 1, "MaxQuantity": 1 },
    { "ItemId": "RareItem",       "Weight": 10,   "MinQuantity": 1, "MaxQuantity": 1 },
    { "ItemId": "LegendaryItem",  "Weight": 1,    "MinQuantity": 1, "MaxQuantity": 1 }
  ]
}
```

Drop probabilities:
- Common: ~90.0%
- Uncommon: ~9.0%
- Rare: ~0.9%
- Legendary: ~0.09%

### Multi-roll with mixed rewards

A supply crate that gives three random items from a mixed pool:

```json
{
  "Rolls": 3,
  "Items": [
    { "ItemId": "{{HealthPotionID}}", "Weight": 40, "MinQuantity": 1, "MaxQuantity": 3 },
    { "ItemId": "{{ManaPotionID}}",   "Weight": 40, "MinQuantity": 1, "MaxQuantity": 3 },
    { "ItemId": "{{GoldCurrencyID}}", "Weight": 30, "MinQuantity": 10, "MaxQuantity": 50 },
    { "ItemId": "{{RareGemID}}",      "Weight": 5,  "MinQuantity": 1, "MaxQuantity": 1 }
  ]
}
```

### Guaranteed + random (pity system)

For a "guaranteed rare or better every 10 opens" pattern, track the player's open count in [Display Properties](../inventory/index.md#display-properties) or [Player Data](../../../player-progression/player-data/quickstart.md), and override the random selection in the Azure Function when the threshold is reached.

### Nested drop tables

A loot table can reference another loot table by ID. Your Azure Function resolves the reference recursively:

```json
{
  "BossDropTable": {
    "Rolls": 2,
    "Items": [
      { "ItemId": "TABLE:WeaponDropTable", "Weight": 50, "MinQuantity": 1, "MaxQuantity": 1 },
      { "ItemId": "TABLE:ArmorDropTable",  "Weight": 30, "MinQuantity": 1, "MaxQuantity": 1 },
      { "ItemId": "{{GoldCurrencyID}}",    "Weight": 80, "MinQuantity": 50, "MaxQuantity": 200 }
    ]
  }
}
```

The function checks if an `ItemId` starts with `TABLE:` and, if so, rolls on the referenced table instead of granting the item directly.

## Security considerations

- **Always run loot logic server-side** in an Azure Function. Never trust the client to determine which items were rolled. This approach prevents manipulation.
- **Use `IdempotencyId`** on the `ExecuteInventoryOperations` call to prevent duplicate grants if the function is retried. For more information, see [Idempotent transactions and retries](idempotent-transactions-and-retries.md).
- **Validate container ownership** by checking the player's inventory before subtracting. The `Subtract` operation in `ExecuteInventoryOperations` fails if the player doesn't have enough tokens, which rolls back the entire batch.
- **Log all rolls** for auditing. The function's return value and PlayStream events provide a trail of what each player received.

## See also

- [Containers with fixed contents](containers-with-fixed-contents.md)
- [ExecuteInventoryOperations API reference](/rest/api/playfab/economy/inventory/execute-inventory-operations)
- [Idempotent transactions and retries](idempotent-transactions-and-retries.md)
- [Title Data](../../../live-service-management/game-configuration/titledata/index.md)
- [Azure Functions quickstart](../../../live-service-management/service-gateway/automation/cloudscript-af/quickstart.md)
- [Drop tables (Legacy Economy)](../../economy/tutorials/drop-tables.md)
- [Economy v2 overview](../overview.md)
