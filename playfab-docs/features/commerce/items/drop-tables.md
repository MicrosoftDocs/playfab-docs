---
title: Drop Tables
author: v-thopra
description: Describes how to create Drop Tables using the PlayFab Game Manager.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, items, catalogs, drop tables
ms.localizationpriority: medium
---

# Drop Tables

This tutorial will tell you how to create Drop Tables using the PlayFab Game Manager. Drop Tables allow you to randomly generate [inventory items](../../data/playerdata/player-inventory.md), and sequential drop-tables can provide some randomness to Player rewards.

## Requirements

- This tutorial assumes familiarity with [Catalogs](catalogs.md), [Inventory](../../data/playerdata/player-inventory.md), and [Game Manager](../../config/gamemanager/game-manager-tour.md)
- You must have a primary catalog, which contains standard, non-bundle/non-container items
- You must have defined at least one virtual currency which you will use as "free" in-game currency

You may use your own set of items, but our goal is to create an overlapping categorization of items. As an example, we'll use the following grid of items:

|                   | Accessory                 | Armor                | Sword           |
|-------------------|:--------------------------|:---------------------|:----------------|
| **Common**        | Common Accessory          | Common Armor         | Common Sword    |
| **Uncommon**      | Uncommon Accessory        | Uncommon Armor       | Uncommon Sword  |
| **Rare**          | Rare Accessory            | Rare Armor           | Rare Sword      |
| **Legendary**     | Legendary Accessory       | Legendary Armor      | Legendary Sword |

Once you have a similar set of items to work with in your catalog, let's build the drop tables.

## Building Drop Tables

**In Game Manager**: Navigate to your title -> Economy -> Catalogs -> {Your primary catalog} -> Drop tables

You should see something like this:

![Game Manager - Catalogs - Drop Tables](media/tutorials/game-manager-catalogs-drop-tables.png)  

1. Begin building drop tables on each of your item descriptors.  Our first categorization is equipment type, so we will create a new drop table called Accessories.

   New Drop Table -> Accessories -> Add Drop Table -> [Popup] Select items: Common Accessory, Uncommon Accessory, Rare Accessory, Legendary Accessory

2. Adjust the weights for the items according to rarity: Common:1000, Uncommon: 100, Rare: 10, Legendary: 1.  The weights indicate how frequently they should drop in comparison to one another.  In this example, you will drop approximately 1000 common's for every legendary.

3. Save Drop Table

![Game Manager - Drop Table - Edit Accessories](media/tutorials/game-manager-drop-table-edit-accessories.png)  

With accessories complete, do the same for Armors and Weapons.

1. Our other categorization is by rarity, so we'll create an alternate set of tables starting with "Common Equipment"  

   New Drop Table -> Accessories -> Add Drop Table -> [Popup] Select items: Common Accessory, Common Armor, Common Weapon  

2. Adjust the weights for items according to how common equipment options will be in that slot. Common Accessory: 1, Common Armor: 4: Common Sword: 

3. Save Drop Table

![Game Manager - Drop Table - Edit Common Equipment](media/tutorials/game-manager-drop-table-edit-common-equipment.png)  

## Using Drop Tables

You can access Drop Tables directly by using the server API methods: [GetRandomResultTables]() or [EvaluateRandomResultTable]().

Using the Server API method, [GetRandomResultTables](), you can read the raw drop table data which we just entered into Game Manager. It does NOT roll random values or award results. This would let you read the data and parse the information however you see fit.

Option 1:

```csharp
public void ReadDropTableData() {
    PlayFabServerAPI.GetRandomResultTables(new GetRandomResultTablesRequest() {
        TableIDs = new List<string> { "Accessories", "Common Equipment" }
    }, result => {
        Debug.Log("Complete getting drop tables");
    }, error => {
        Debug.LogError(error.GenerateErrorReport());
    });
}
```

The result handler will receive the structure information we input above, formatted as [GetRandomResultTablesResult]().

Alternately, you can let PlayFab evaluate the table for you and give you a single item result. Doing so returns the itemId that can be used to generate a single item, rolled according to the weights provided. You can then make a second call which creates the item and gives it to the player.

Option 2:

```csharp
public void Grant(string playFabId, string tableId) {
    // First, roll a random number and evaluate the drop table
    PlayFabServerAPI.EvaluateRandomResultTable(new EvaluateRandomResultTableRequest()
    {
        TableId = tableId
    }, result => OnRandomResultTableResponse(result, playFabId), OnError);
}

public void OnRandomResultTableResponse(EvaluateRandomResultTableResult tableResult, string playFabId) {
    // Second, take the result and grant it to the player
    PlayFabServerAPI.GrantItemsToUser(new GrantItemsToUserRequest {
        PlayFabId = playFabId,
        ItemIds = new List<string> { tableResult.ResultItemId }
    }, result =>
    {
        // Handle Result
    }, OnError);
}

public void OnError(PlayFabError error) {
    Debug.LogError(error.GenerateErrorReport());
}
```

Option 1 allows you to load the data once, cache it, and perform the roll yourself on your own game-server. This has lower latency due to fewer calls to PlayFab, and allows you to customize the rolls based on game-specific logic. Option 2 lets PlayFab do more of the work, but multiple API calls means higher latency.

## Advanced Drop Table Usage (Setting up a Loot Crate)

Drop Tables can be linked from bundles and containers. Bundles are a great option for Virtual Currency stores where a single purchase yields a stack of random items.

**Example Case**: An 11-item bundle with specific drop rules. In this case, it is a customer-facing selling point that we will guarantee one legendary item. We'll also restrict it so that the player can't get TOO lucky, and receive 11 Legendaries.

New Drop Table: Let's build a drop table that can literally drop anything. Call it Anything, give it other drop tables as its options, with appropriate weights:

![Game Manager - New Drop Table](media/tutorials/game-manager-new-drop-table.png)  

At this point, we're done with Drop Tables, and we're going to navigate to Bundles. In a Catalog, Bundles is another tab beside Drop Tables.

![Game Manager - New Catalog Bundle](media/tutorials/game-manager-new-catalog-bundle.png)  

This bundle uses several features:

- All items of any kind must have an Item ID.
- A bundle counts as its own item, and its bundle contents are delivered at the same time it is granted. For this reason, we're making the bundle item itself consumable, and it expires 15 seconds after delivery.
- We add different drop tables in different quantities to ensure that 11 items are delivered, but different items roll on different tables
  - First, we guarantee at least 1 legendary item, so the first slot will roll on "Legendary Equipment".
  - The next 3 slots roll on "Anything" which can roll additional legendaries, or roll crappy common equipment. These rolls will define a good roll vs. a bad one, as these 3 items can vary wildly.
  - Finally, we fill in the remaining slots with guaranteed rares and uncommons, ensuring that an 11 item roll is not too good, and not too bad.

## Conclusion 

A drop table generates a single item randomly from a list of potential items and weights. Bundles and Containers can be one of the simplest ways to deliver one or more items to a player using Drop Tables. You can manually use a Drop Table from a [Custom Game Server](../../multiplayer/compute/custom-game-servers.md) or [Cloud Script](../../automation/cloudscript/writing-custom-cloudscript.md), using the server API methods: [GetRandomResultTables](xref:titleid.playfabapi.com.server.playeritemmanagement.getrandomresulttables) or [EvaluateRandomResultTable](xref:titleid.playfabapi.com.server.playeritemmanagement.evaluaterandomresulttable).
