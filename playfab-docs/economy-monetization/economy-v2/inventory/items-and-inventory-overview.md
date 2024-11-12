---
title: Items and Inventory Overview
author: thomasgu
description: Overall description of Items and Inventory in V2.
ms.author: thomg
ms.date: 07/01/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, items, catalogs
ms.localizationpriority: medium
---

# PlayFab Items and Inventory Overview

Items and inventories are essential features for creating engaging and immersive games. They allow you to offer customization options, rewards, progression systems, and monetization opportunities for your players. 

PlayFab provides a flexible and powerful platform for creating and managing these virtual goods. You can use PlayFab to define different types of items, such as durables, consumables, bundles, containers, and more. You can also use PlayFab to track the ownership and usage of items by your players. Here are some of the key concepts you need to know about items and inventories in PlayFab:

[!INCLUDE [notice](../../../includes/_economy-deprecation.md)]

## Key concepts

* **Catalog** - A catalog is a collection of all the items that are available in your game. Catalogs offer an easy way to manage your game's virtual items. 
* **Catalog Items** – Catalog items are the individual items that you define in your catalog. They can represent any kind of virtual good that you want to offer in your game, such as weapons, outfits, power-ups, loot boxes, etc. You can customize the properties and behaviors of catalog items to suit your game design.
* **Catalog Stores** - You can use store create multiple item listings for different purposes, such as seasonal events, promotions, or testing.
* **Player Inventory Collections** -  Inventory is a record of the items that a player owns or has used in your game. It also contains information about the player’s virtual currency balances and item history. All player accounts can have one or more inventories, which we call inventory collections. 
* **Virtual Currency** - Virtual currency is a type of item that can be used as a medium of exchange in your game. You commonly use virtual currency to sell or buy other items from the catalog or a store. You can also use virtual currency to implement soft currency conversions from in-app purchases or to drive gameplay mechanics.

For more information about these and other related concepts, please refer to the [Economy V2 Catalog Overview](../catalog/catalog-overview.md) 

## Key APIs

PlayFab provides a large interactive playing field for interaction with items and inventory, and the Item definition in the Catalog allows for quite a bit of customization. A rich set of APIs is available for interacting with items and inventories in your game. You can use these APIs to perform various actions, such as purchasing items, granting items, consuming items, updating inventory, and querying inventory. Most common interactions are through a few key APIs:

* **PurchaseInventoryItems** - This API allows a player to buy catalog items or bundles with virtual currency. It deducts the currency from the player’s inventory and adds an item instance to the player’s inventory.
* **GetInventoryItems** - Allows you to retrieve the current inventory of an Entity, and will return a list of item instances for the specified player.
* **UpdateInventoryItems** - Used to make convenient changes to inventory items, especially to DisplayProperties for modifying custom attributes.
* **GetTransactionHistory** - Will get the latest transaction events from the inventory, and allow you to page through to get the full transaction history.

For more information on how to use these APIs and other related APIs, please refer to the [PlayFab Inventory API documentation](https://learn.microsoft.com/rest/api/playfab/economy/inventory?view=playfab-rest) 
