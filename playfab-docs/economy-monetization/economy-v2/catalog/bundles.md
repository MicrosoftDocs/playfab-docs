---
title: Economy v2 Bundles
author: fprotti96
description: Introduction to Economy v2 Bundles.
ms.author: fprotti
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, catalog, bundles
ms.localizationpriority: medium
---

# Economy v2 Bundles

[!INCLUDE [note](../../../includes/_economy-release.md)]

Bundles allow you to group multiple items together into a single item. You can create bundles of items that are often purchased together, or items that are only available for a limited time.

## Creating a Bundle

To create a bundle, you must first make sure you have published Catalog Items, Currency, or user-generated content (UGC) that you want to be accessible/purchaseable in your game. You can follow the steps in the [Economy V2 Quickstart](../quickstart.md#step-3---publish-an-item-to-the-catalog)

### [GameManager](#tab/creating-bundle-game-manager)

1. Navigate to **Economy** > **Catalog (V2)**.
1. Under the **Bundles** tab, select **New Bundle**.

### [API](#tab/creating-bundle-api)

You can use the `CreateDraftItem` to create a bundle.

```json

{
  "Item": {
    "Type": "bundle",
    "Title": {
      "NEUTRAL": "My First Bundle"
    },
    
    "StartDate": "2023-03-07T00:01:00.0000000Z",
    "ItemReferences":
        [{
            "Id":"{{LaserSwordID}}",
            "Amount": 2
        }, 
        {
            "Id":"{{LaserGunID}}", 
            "Amount": 2
        }],

    "PriceOptions": {
        "Prices": [
        {
              "Amounts": [
                {
                    "ItemId": "{{DiamondID}}",
                    "Amount": 5
                },
                {
                    "ItemId": "{{GoldID}}",
                    "Amount": 10
                }
                ]
        }
         ]
          }
        },
  "Publish": true
}

```

***

Response:

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "Item": {
            "Id": "{{BundleID}}",
            "Type": "bundle",
            "AlternateIds": [],
            "Title": {
                "NEUTRAL": "My First Bundle"
            },
    ...
}
```

## Purchasing and Unpacking Bundles

When a player purchases a bundle, the bundle is **automatically unpacked—the individual items referenced in the bundle are granted directly to the player's inventory. The bundle itself doesn't appear as an inventory item. For more details on how bundles interact with inventory, see [Bundles in Inventory](../inventory/index.md#bundles).

Bundles are also the primary mechanism for linking real-money marketplace products to in-game items. Each bundle can be linked to one or more marketplace products using `AlternateIds`. For more information, see [Fraud Prevention Quickstart](../fraud-prevention/quickstart.md).

## See also

* [Inventory Overview](../inventory/index.md)
* [Stores](stores.md)
* [Marketplace Integrations](../marketplace/marketplace-integrations/overview.md)
* [Fraud Prevention](../fraud-prevention/index.md)
