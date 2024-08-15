---
title: Economy v2 Stores
author: wesjong
description: Introduction to Economy v2 Stores and best practices.
ms.author: wesjong
ms.date: 9/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, localization, internationalization, i8n
ms.localizationpriority: medium
---

# Economy v2 Stores

[!INCLUDE [notice](../../includes/_economy-release.md)]

Stores are an excellent way to build upon and develop your in-game Economy. Stores are a special item type that hold a list of items and prices and allow you to override base catalog prices for items. Stores can be used to manage where items are purchasable in your game, offer in-game discounts and promotions, and much more!

## Creating a Store

To create a store, you must first make sure you have other published Catalog Items, Currency, or UGC that you want to be accessible/purchasable in your game. You can follow the steps in the [Economy v2 Quickstart](quickstart.md#step-3---publish-an-item-to-the-catalog)

### [GameManager](#tab/creating-store-game-manager)

1. Navigate to **Economy** > **Catalog (V2)**.

2. Under the **Stores** tab, select **New Store**.

Fill in the desired metadata, one of the key things to be setting is the items you wish to be available at this store and what prices you wish to override them to.

### [API](#tab/creating-store-api)

You can use the `CreateDraftItem` to create a store.

An example `CreateDraftItem` request to create a store:

```json
{
  "Item": {
   "Type": "store",
    "Title": {
      "NEUTRAL": "My First Store",
    },
    "StartDate": "2022-09-07T00:00:00.00000000Z",
    "ItemReferences":[
      {
        "Id":"LaserSword",
        "Amount": 1,
        "PriceOptions": {
          "Prices": [{
            "Amounts": [{
              "ItemId": "Diamond",
              "Amount": 1
            }]
          }]
        }
      },
      {
      "Id":"WeaponBundle",
      "PriceOptions": {
        "Prices": [{
          "Amounts": [{
            "ItemId": "Gold",
            "Amount": 10
            },
            {
            "ItemId": "Silver",
            "Amount": 10
          }]
        }],
      },
    }]
   },
   "Publish": true
}
```

***

The above is a store that sells two items, the `LaserSword` and the `WeaponBundle`. Both items are existing catalog items with some existing base price as defined in the catalog. This store, overrides their existing prices and now offers the `LaserSword` for 1 `Diamond` and the `WeaponBundle` for 10 Gold and 10 Silver.

This request would return a response that the store has been created and published:

```json
{
  "code": 202,
  "status": "Accepted",
  "Item": {
    "Type": "store",
    "Id": "{{StoreID}}", 
    "Title": {
      "NEUTRAL": "My First Store",
    },
    ...
}
```

Note the `Id` that is now associated with our published store.

> [!NOTE]
> To help simplify the concept, the Item Ids have been swapped from GUIDs to the Item Names to better illustrate the example of using Stores.

## Using a Store

Stores are used when players call the `PurchaseInventoryItems` API. When you call `PurchaseInventoryItems`, one of the optional properties is a `StoreId` parameter where we can pass in the Store we use to apply to this purchase request.

An example `PurchaseInventoryItems` request using a store:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    },
    "Item": {
        "Id": "LaserSword",
    },
    "Amount": 10,
    "PriceAmounts": [
        {
            "ItemId": "Diamond",
            "Amount": 1
        }
    ],
    "StoreId": "{{StoreID}}"
}
```

Note the `{{StoreId}}` passed into the purchase request and how the anticipated `PriceAmount` now matches the 1 Diamond Cost as set in our store.

## Searching a Store

When you use the `SearchItems` API, one of the properties you can pass in is the `Store` parameter. This parameter allows you to search within the context of a store. In addition to being able to check if an item exists in a particular store, it also can be used to display the overridden prices of the store's items/contents. You can also use the `AlternateId` of the store to search for it.

```json
{
  "Search": "",
  "Filter": "ContentType eq 'weapons'",
  "Store": {
    "Id": "{{StoreID}}"
  },
}
```
