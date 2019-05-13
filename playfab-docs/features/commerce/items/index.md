---
title: Items
author: v-thopra
description: Landing page for Items.
ms.author: v-thopra
ms.date: 01/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, items, catalogs
ms.localizationpriority: medium
---

# PlayFab items

Items and inventories are common mechanisms that you can use to add customization and depth to your game. Defining and tracking items in PlayFab gives you top-notch analytics and LiveOps support for your in-game catalog.

## Key concepts

* **Catalog** - Catalogs offer an easy way to manage your game's virtual items. They are listings of every item  available in your game.
* **Catalog Items** – PlayFab Items can represent just about any type of virtual goods that you might use, from Durables to Bundles to Locked containers.
* **Player Inventory** - All Player Accounts have an inventory. The inventory contains all of the owned Item Instances as well as the item history to-date.
* **Virtual Currency** - PlayFab offers up to 10 virtual currencies per title. Currencies can be used to purchase Items from the Catalog or a Store, represent soft currency converted from In App Purchases, or be used as a mechanic to drive gameplay.

PlayFab provides a large interactive playing field for interaction with items and inventory, and the Item definition in the Catalog allows for quite a bit of customization. However, most common interactions are through just a few key APIs:

* [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) - Buys a single catalog item with virtual currency, subtracting the currency and adding an Item Instance into the Player/Character Inventory.
* [GetCharacterInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getcharacterinventory) and [GetUserInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getuserinventory) – These APIs retrieve the specified Character or the player’s current Inventory of virtual goods.