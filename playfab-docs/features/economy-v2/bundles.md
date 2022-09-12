---
title: Economy v2 Bundles
author: cybtachyon
description: Introduction to Economy v2 Bundles.
ms.author: derekreese
ms.date: 9/07/2022
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, catalog, bundles
ms.localizationpriority: medium
---

# Economy v2 Bundles

[!INCLUDE [note](../../includes/_economy-release.md)]

Bundles allow you to group multiple items together into a single item. You can create bundles of items that are often purchased together, or items that are only available for a limited time.

## Creating a Bundle

To create a bundle, you must first make sure you have published Catalog Items, Currency, or UGC that you want to be accessible/purchaseable in your game. You can follow the steps in the [Economy V2 Quickstart](quickstart.md#step-3---publish-an-item-to-the-catalog)

### [GameManager](#tab/creating-bundle-game-manager)

1. Navigate to `Economy` > `Catalog (V2)`.
1. Under the `Bundles` tab, select `New Bundle`.

### [API](#tab/creating-bundle-api)

You can use the `CreateDraftItem` to create a bundle.

```json
{
  "Item": {
   "Type": "bundle",
    "Title": {
      "NEUTRAL": "My First bundle",
    },
    "StartDate": "2022-09-07T00:01:00.0000000Z",
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

Response:

```json
{
  "code": 202,
  "status": "Accepted",
  "Item": {
    "Type": "bundle",
    "Id": "{ID}", 
    "Title": {
      "NEUTRAL": "My First Bundle",
    },
    ...
}
```
