---
title: Containers with fixed contents in Economy v2
author: ernestoc
description: How to implement fixed-contents containers in Economy v2 using bundles and virtual currency
ms.author: ernestoc
ms.date: 02/23/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy, containers, bundles, virtual currency
ms.localizationpriority: medium
---

# Containers with fixed contents in Economy v2

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Economy v1 (Legacy) had a built-in **Containers** feature—special catalog items that, when opened, granted their contents to the player's inventory. Economy v2 doesn't include containers as a native item type, but you can achieve the same behavior for **fixed-contents containers** (containers that always grant the same items) by using a combination of virtual currency and bundles.

## How it works

The pattern uses three Economy v2 building blocks:

1. **A virtual currency (or stackable item)** that represents the container itself—for example, "Treasure Chest Token."
2. **A Bundle** priced at 1 of that currency, containing the items the container should grant.
3. **A purchase call** where the player spends 1 token to buy the bundle, which automatically unpacks and grants the items.

From the player's perspective, they receive a token (via gameplay rewards, store purchases, and so on), then "open" it to get the items inside—exactly how V1 containers worked.

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- A Title created in [Game Manager](https://developer.playfab.com/).
- At least one published catalog item that you want the container to grant.

## Step 1: Create a virtual currency for the container

Create a virtual currency that represents the container. Each unit of this currency acts as one unopened container.

### [Game Manager](#tab/create-currency-gm)

1. Go to **Economy** > **Catalog (V2)** > **Currency**.
2. Select **New currency**.
3. Set the **Title** to a descriptive name, such as `Treasure Chest`.
4. Set the **FriendlyId** to a short code, such as `tc`.
5. Select **Save and publish**.

### [REST API](#tab/create-currency-api)

Call [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item):

```json
{
  "Item": {
    "CreatorEntity": {
      "Id": "{{TitleID}}",
      "Type": "title"
    },
    "Type": "currency",
    "AlternateIds": [
      {
        "Type": "FriendlyId",
        "Value": "tc"
      }
    ],
    "Title": {
      "NEUTRAL": "Treasure Chest"
    },
    "Description": {
      "NEUTRAL": "A treasure chest that can be opened to reveal its contents."
    },
    "StartDate": "2023-07-27T00:00:00.000Z"
  },
  "Publish": true
}
```

---

## Step 2: Create a bundle priced at one container token

Create a bundle that contains the items you want the container to grant. Price the bundle at exactly one unit of the container currency.

### [Game Manager](#tab/create-bundle-gm)

1. Go to **Economy** > **Catalog (V2)** > **Bundles**.
2. Select **New bundle**.
3. Set the **Title** to describe the container's contents, such as `Treasure Chest Contents`.
4. Under **Items**, add the items and quantities you want the container to grant—for example, 1 **Legendary Sword** and 100 **Gold**.
5. Under **Price**, set the price to **1** of your container currency (**Treasure Chest**).
6. Select **Save and publish**.

### [REST API](#tab/create-bundle-api)

Call [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item):

```json
{
  "Item": {
    "Type": "bundle",
    "Title": {
      "NEUTRAL": "Treasure Chest Contents"
    },
    "StartDate": "2023-07-27T00:00:00.000Z",
    "ItemReferences": [
      {
        "Id": "{{LegendarySwordID}}",
        "Amount": 1
      },
      {
        "Id": "{{GoldCurrencyID}}",
        "Amount": 100
      }
    ],
    "PriceOptions": {
      "Prices": [
        {
          "Amounts": [
            {
              "ItemId": "{{TreasureChestCurrencyID}}",
              "Amount": 1
            }
          ]
        }
      ]
    }
  },
  "Publish": true
}
```

---

When a player purchases this bundle, the bundle is [automatically unpacked](../catalog/bundles.md#purchasing-and-unpacking-bundles)—the individual items go directly to the player's inventory.

## Step 3: Grant container tokens to players

Grant the container currency to players through any mechanism that fits your game design:

- **Gameplay rewards**—Grant tokens after completing a level, quest, or achievement by using [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items).
- **Store purchases**—Sell the container token in a [Store](../catalog/stores.md) for another virtual currency or real money.
- **Battle pass / seasonal rewards**—Include the token as a reward tier.

Example using `AddInventoryItems` to grant three Treasure Chest tokens:

```json
{
  "Entity": {
    "Type": "title_player_account",
    "Id": "{{PlayerID}}"
  },
  "Item": {
    "Id": "{{TreasureChestCurrencyID}}"
  },
  "Amount": 3
}
```

## Step 4: Open the container

When the player wants to open a container, call [PurchaseInventoryItems](/rest/api/playfab/economy/inventory/purchase-inventory-items) to buy the bundle with one container token:

```json
{
  "Entity": {
    "Type": "title_player_account",
    "Id": "{{PlayerID}}"
  },
  "Item": {
    "Id": "{{TreasureChestContentsBundleID}}"
  },
  "Amount": 1,
  "PriceAmounts": [
    {
      "ItemId": "{{TreasureChestCurrencyID}}",
      "Amount": 1
    }
  ]
}
```

After a successful call, the player's inventory is updated: One Treasure Chest token is deducted and the bundle's contents (one Legendary Sword + 100 Gold) are added.

## Multiple container types

Create multiple container types by repeating this pattern. For example:

| Container | Currency (FriendlyId) | Bundle contents |
|---|---|---|
| Treasure Chest | `tc` | One Legendary Sword + 100 Gold |
| Supply Crate | `sc` | Five Health Potions + 3 Mana Potions |
| Premium Box | `pb` | One Rare Mount + 500 Gold + 50 Gems |

Each container type has its own currency and bundle.

## Using a Store for container purchases

Use a [Store](../catalog/stores.md) to override the container bundle's price. By using a store, you can offer the same container at different prices in different contexts (for example, a discounted "open" cost during an event):

```json
{
  "Item": {
    "Type": "store",
    "Title": {
      "NEUTRAL": "Event Store"
    },
    "ItemReferences": [
      {
        "Id": "{{TreasureChestContentsBundleID}}",
        "Amount": 1,
        "PriceOptions": {
          "Prices": [
            {
              "Amounts": [
                {
                  "ItemId": "{{TreasureChestCurrencyID}}",
                  "Amount": 1
                }
              ]
            }
          ]
        }
      }
    ]
  },
  "Publish": true
}
```

Then pass the `StoreId` when purchasing:

```json
{
  "Entity": {
    "Type": "title_player_account",
    "Id": "{{PlayerID}}"
  },
  "Item": {
    "Id": "{{TreasureChestContentsBundleID}}"
  },
  "Amount": 1,
  "PriceAmounts": [
    {
      "ItemId": "{{TreasureChestCurrencyID}}",
      "Amount": 1
    }
  ],
  "StoreId": "{{EventStoreID}}"
}
```

## Limitations

This pattern works for containers with **fixed, deterministic contents**. If you need **randomized loot** (where the contents vary each time a container is opened, similar to V1 containers paired with drop tables), see the [Drop tables and randomized loot](drop-tables-and-randomized-loot.md) tutorial. This tutorial uses [Azure Functions](/azure/azure-functions/functions-overview) to:

1. Subtract the container token from the player's inventory.
2. Run your weighted random selection logic.
3. Grant the resulting items through the inventory APIs.

## See also

- [Economy v2 Bundles](../catalog/bundles.md)
- [Economy v2 Stores](../catalog/stores.md)
- [Virtual currencies](currencies.md)
- [Economy v2 overview](../overview.md)
- [PurchaseInventoryItems API reference](/rest/api/playfab/economy/inventory/purchase-inventory-items)
- [AddInventoryItems API reference](/rest/api/playfab/economy/inventory/add-inventory-items)
