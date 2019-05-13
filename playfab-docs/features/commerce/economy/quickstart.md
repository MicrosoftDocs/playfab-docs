---
title: Economy quickstart
author: thomasgu
description: Quickstart for Economy.
ms.author: tomg
ms.date: 05/02/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, media, coupons, promotions, cloudscript
ms.localizationpriority: medium
---

# Economy quickstart

Making monetization work is one of the biggest challenges of games. PlayFab simplifies this for you, by building on top of three foundational pieces: Currencies, Items, and Inventory.

In this quickstart, you will:

1. Set up a virtual currency.
2. Create an item.
3. Add an item to a player's inventory.
4. Learn the next steps for customizing your economy.

## Setting up a virtual currency

Virtual currencies are the foundation of in-game economies. Players and characters can be granted these currencies, which can then be used to buy or trade items.

Items can have a cost in either a virtual currency or real money. Each title can support multiple arbitrary virtual currencies. This provides flexibility for your game to implement whatever medium of exchange you desire (for example, gold, gems, hearts, or interstellar credits).

To create a virtual currency:

1. Open **Game Manager** and select **Economy** on the left side bar.
2. Select the **Currency** tab.
3. Choose **New Currency** and change these fields (as shown in the image below):
   - Set **Currency code (2 uppercase characters)** to **GD**.
   - Set **Display name** to **Gold**.
4. Select **SAVE CURRENCY**.

![Create Item](media/tutorials/game-manager-economy-currency-new-currency.png)

Now that a currency has been set up, catalog items can be assigned prices corresponding to the virtual currency.

## Creating an item

Many games offer the player items for purchase such as a shield, a level-unlock, or a power-up. These items are specified in a catalog. Before the player can purchase an item from a catalog, you must create the items to populate it.

To create a catalog with an item:

1. Select **Economy** on the left side bar and select the **Catalogs** tab.
2. Choose the **NEW CATALOG** button and enter **main** as the **Catalog version**. An item with the ID of **One** is added automatically.
3. Select **One** and change these fields (as shown in the image below):

   - Set **Item ID** to **apple**.
   - Set **Display name** to **apple**.
   - Set **Description** to **Perfectly normal apple**.

4. At the bottom of the form is the **PRICES** section, where you define how much an item costs in your game's virtual currency.
5. Set the apple's price in gold (**GD**) to **5**.
6. Select the **SAVE ITEM** button.

![Edit or Save Currency](media/tutorials/create-item.png)

## Adding an item to a player inventory

PlayFab’s [Player Item Management (Server)](xref:titleid.playfabapi.com.server.playeritemmanagement) and [Player Item Management (Client)](xref:titleid.playfabapi.com.client.playeritemmanagement) APIs support many strategies for item purchasing, such as simple real money or virtual currency purchases of items, triggered item grants based on buying another item, locked (with a potentially purchasable key) and unlocked boxes, random result tables, and non-purchasable items that are granted based on events within a game.

Let's use the PlayFab APIs to add an item to a player's inventory by purchasing it with virtual currency.

1. In your game, log in as a player that has been given virtual currency. ([Giving virtual currency to a player](../items/quickstart#giving-virtual-currency-to-a-player) has more information, if needed.)
2. Call [GetCatalogItems](xref:titleid.playfabapi.com.client.title-widedatamanagement.getcatalogitems) with the following parameter in the request:
   - `CatalogVersion = "main"`
3. Verify that the `Catalog` in the result contains an **apple** with a **GD** price of **5**.
4. Call [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) to buy the **apple**, with these parameter values in the request:

   - `CatalogVersion = "main"`
   - `ItemId = "apple"`
   - `VirtualCurrency  = "GD"`
   - `Price =  5`

5. Finally, call [GetUserInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getuserinventory) and look in the result of that method. In the array of items in the player's `Inventory` - you should see an apple!

## Next Steps for customizing your economy

Once you have a Catalog with Items supported by Virtual Currencies, you can light up your economy with:

- **Real World Purchases**: our [Getting started with PlayFab, Unity IAP, and Android](getting-started-with-unity-iap-android.md) and our [Non-receipt payment processing](non-receipt-payment-processing.md) tutorials help you connect your virtual economy with existing stores.
- **Leveraging your Catalog**: to create Bundles, Containers and Drop Tables. For more information, see our [Catalogs](../items/catalogs.md) tutorial.
- **Using Item attributes**: to define multiple prices and specify stackable, tradable, and limited edition [Items](../items/index.md).
- **Setting up unique in-game vendors or Sales events**: using [Stores and Sales](../stores/stores-and-sales.md).
- **Creating some player Segments and use Stores**: to drive different item and bundle offers to your players regardless of where they are in your game lifecycle. For an example, see our [Custom stores for player segments](../stores/custom-stores-for-player-segments.md) tutorial.
- **Verifying your assumptions**: using [A/B testing](../../analytics/ab-testing/index.md).
- **Gathering economic data**: enabling you to improve and iterate your game using PlayFab [Reports](../../analytics/reports/index.md).
