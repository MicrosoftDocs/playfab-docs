---
title: Economy quickstart
author: thomasgu
description: Quickstart for Economy.
ms.author: tomg
ms.date: 01/30/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, media, coupons, promotions, cloudscript
ms.localizationpriority: medium
---

# Economy quickstart

Making monetization work is one of the biggest challenges of games. Playfab helps make this easy by building on top of three foundational pieces: Currencies, Items, and Inventory.

In this quick-start tutorial, you will:

1. Set up a virtual Currency.
2. Create an Item.
3. Add an item to a player Inventory.
4. Next Steps for customizing your Economy.

## Set up a Virtual Currency

Virtual Currencies are the foundation of in-Game economies. Players and Characters can be granted these Currencies, which can then be used to buy or trade Items. Items can have a cost in either a Virtual Currency or Real Money. Each Title can support multiple arbitrary Virtual Currencies. This provides flexibility for your Game to implement whatever medium of exchange you desire (e.g. Gold, Gems, Hearts or Interstellar Credits).
 
1. Go to Economy and select Currencies.
2. Click New currency and change these fields:
    Currency code (2 uppercase characters): "GD"
    Display name: "Gold"
3. Click Save currency.
 
Now that Currencies have been setup, Store and Catalog Items can be assigned prices corresponding to the Virtual Currencies.

## Create an item

Many games offer the player items for purchase such as a Shield, a Level-unlock, or a Power-up. These items are specified in a Catalog. Before the Player can purchase an Item from any Catalog, you must create the Items that you want to populate it.

To make a Catalog with an Item:

1. Go to Economy and select Catalogs.
2. Create a new catalog named "main." An item with the ID of "One" has been added automatically.
3. Click on One and change these fields:
    Item ID: "apple"
    Display name: "Perfectly normal apple"
4. At the bottom of the form is the Prices section, where you define how much an item costs in your           game's virtual currency.
5. Set the apple's price in gold ("GD") to 5.
6. Click Save item.
 
## Add an item to a player Inventory

Playfab’s Catalog APIs support many strategies for Item purchasing, such as simple Real Money or Virtual Currency purchases of Items, triggered item grants based on buying another Item, locked (with a potentially purchasable Key) and unlocked boxes, random result tables, and non-purchasable items that are granted based on Events within a Game. In this Quickstart we cover the Virtual Currency purchase use case.

1. In your game, call GetCatalogItems
    CatalogVersion: "main"
2. Verify that you see an "apple" with a "GO" price of 5
3. Then call PurchaseItem to buy the apple
    CatalogVersion: "main"
    ItemId: "apple"
    VirtualCurrency: "GO"
    Price: 5
4. Finally, call GetUserInventory and take a look at the player inventory. You should see an apple!

## Next Steps for Customizing your Economy

Once you have a Catalog with Items supported by Virtual Currencies, you can use light up your economy with all sorts of scenarios:

1. Real World Purchases: our Getting Started with In App Purchasing and our Non-Receipt Payment Processing    tutorials help you connect your virtual economy with existing stores
2. You can leverage your Catalog to create Bundles, Containers and Drop Tables. 
3. You can use Item attributes to define multiple prices and specify stackable, tradable, and limited         edition Items. 
4. Set up unique in-game vendors or Sales events using Stores and Sales.
5. Create some player Segments and use Stores to drive different item and bundle offers to your players       regardless of where they are in your game lifecycle:  Custom Stores for Player Segments
6. Verify your assumptions using A/B Testing 
7. Finally, gather economic data so that you can improve and iterate on your game using Playfab Reports
