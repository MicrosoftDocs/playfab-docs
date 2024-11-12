---
title: Player Inventory Quickstart
author: wesjong
description: In this quickstart, you purchase your first item and check your player's inventory via the APIs.
ms.author: wesjong
ms.date: 7/09/2022
ms.topic: quickstart
ms.service: azure-playfab
keywords: playfab, commerce, economy, inventory
ms.localizationpriority: medium
---

# Quickstart: Add your first item to a player's inventory

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Get familiarized with Player Inventories by using the PlayFab Beta SDK to purchase an item and check that it has been added to your player's inventory. After getting an entity token to interact with your title via the APIs, you search for an item in your catalog, purchase the item, and then get the player's inventory to find the purchased item.

## Prerequisites

* A [PlayFab developer account](https://developer.playfab.com)
* The PlayFab Beta SDK (You can find more information on the [Postman Quickstart](../../../sdks/postman/postman-quickstart.md#adding-playfab-collections))
* At least one item in your catalog (You can find more information on the [Economy v2 Quickstart](../quickstart.md))
* At least one player with sufficient virtual currency to purchase an item

## Sign in as the player

You first need to sign in the player to receive the security token required for the remainder of the API calls in this quickstart. You can find more information on the [Player Authentication](../../authentication/login/index.md) page.

## Search for the item

To find the item in the catalog, you'll need to call `Search`. In the call body:

```json
{
  "Search": "[Item Title]",
  "Top": 1
}
```

* The `Search` is the search string that will be fuzzy searched against the Title, Description, and Keywords of every item in your catalog
* `Top` is an integer that determines how many results to return - in this case we only need one

> [!NOTE]
> There are additional fields you can learn about in the [Search quickstart](../catalog/search.md).

In the response, grab the following fields:

* `Items` > `Id` - Catalog ID of the item
* `Items` > `PriceOptions` > `Prices` > `Amounts` > `ItemId` - ID of the virtual currency used to purchase the item
* `Items` > `PriceOptions` > `Prices` > `Amounts` > `Amount` - Amount of the virtual currency needed to purchase the item

> [!NOTE]
> Only Title Entities are able to set prices for Items

## Purchase the item

To purchase the item call `PurchaseInventoryItems`. In the call body:

```json
{
  "Item": {
    "Id": "{{ItemID}}",
  },
  "Amount": 1,
  "PriceAmounts": [
    {
      "ItemId": "{{CurrencyId}}",
      "Amount": 15
    }
  ]
}
```

* The `Item.Id` is the ID of the item (pulled from the `Search` response in the previous step)
* The `Amount` is the number of items the player is purchasing
* The `ItemId` is the ID of the virtual currency used to purchase the item (pulled from the `Search` response in the previous step)
* The `Amount` is the amount of the virtual currency needed to purchase the item (pulled from the `Search` response in the previous step)

## Get the player's inventory items

See the player's newly purchased item via `GetInventoryItems`. In the call, ensure the body is empty - you can specify the entity in the body, but isn't necessary, as the information is already being passed in through the entity token in the header.

The response contains IDs of each item the player owns and the amount of each item. The newly purchased item will be in the player's inventory.

> [!NOTE]
> If the player already has that item in their inventory with the same `StackId`, you won't see another item instance after the purchase - instead, you'll simply see the `Amount` field increase.

## Troubleshooting

* Insufficient funds
  * If you call `PurchaseInventoryItems` and receive a `422: InsufficientFunds` error, the player doesn't have enough virtual currency to purchase the item. You can grant virtual currency to the player by calling `AddInventoryItems` (requires title entity token) or navigating to **\[Title\]** > **Players** > **\[Player\]** > **`Inventory (V2)`** in Game Manager
* The item can't be purchased at the specified price
  * If you call `PurchaseInventoryItems` and receive a `1071` error code, the `PriceAmounts` field doesn't match the prices specified in the catalog.

## Next steps

Now that you purchased the player's first item, you can consume the item, you can add the item to a store to put it on sale, and you can create and purchase a bundle containing the item.

> [!div class="nextstepaction"]
> [Player inventory tutorial](../tutorials/getting-started-with-unity-and-android.md)

> [!div class="nextstepaction"]
> [Stores](../stores.md)

> [!div class="nextstepaction"]
> [Bundles](../bundles.md)
