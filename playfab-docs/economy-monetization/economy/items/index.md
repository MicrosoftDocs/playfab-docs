---
title: Items (Legacy Economy)
author: cybtachyon
description: Landing page for (Legacy) Items.
ms.author: derekreese
ms.date: 01/25/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, items, catalogs
ms.localizationpriority: medium
---

# PlayFab Items (Legacy Economy)

[!INCLUDE [notice](../../../includes/_economy-deprecation.md)]

Items and inventories are common mechanisms that you can use to add customization and depth to your game. Defining and tracking items in PlayFab gives you top-notch analytics and LiveOps support for your in-game catalog.

## Key concepts

* **Catalog** - Catalogs offer an easy way to manage your game's virtual items. They're listings of every item  available in your game.
* **Catalog Items** – PlayFab Items can represent just about any type of virtual goods that you might use, from Durables to Bundles to Locked containers.
* **Player Inventory** - All player accounts have an inventory. The inventory contains all of the owned Item Instances and item history to-date.
* **Virtual Currency** - Currencies can be used to purchase Items from the Catalog or a Store, represent soft currency converted from In App Purchases, or be used as a mechanic to drive game play.

PlayFab provides a large interactive playing field for interaction with items and inventory, and the Item definition in the Catalog allows for quite a bit of customization. However, most common interactions are through just a few key APIs:

* [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) - Buys a single catalog item with virtual currency, subtracting the currency and adding an Item Instance into the Player/Character Inventory.
* [GetCharacterInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getcharacterinventory) and [GetUserInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getuserinventory) – These APIs retrieve the specified Character or the player’s current Inventory of virtual goods.
