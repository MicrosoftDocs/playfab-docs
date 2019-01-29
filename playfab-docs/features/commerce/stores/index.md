---
title: Stores
author: v-thopra
description: Landing page for Stores.
ms.author: v-thopra
ms.date: 01/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, stores
ms.localizationpriority: medium
---

# PlayFab Stores

Stores are the best way to let players purchase items in your game. You can use the Game Manager to change the order of items and adjust prices at any time. Using Segments, you can even give special prices to certain players without touching your game code.  
  
## Key concepts

* **Catalog** - Catalogs offer an easy way to manage your game's virtual items. They are listings of every item that is available in your game.  
* **Catalog Items** – PlayFab Items can represent just about any type of virtual good that you might use, from Durables, to Bundles to Locked containers.  
* **Player Inventory** - All PlayerAccounts have an inventory. The inventory contains all of the owned Item Instances as well as the item history to-date.  
* **Character Inventory** - Similar to Player Inventory, except stored at a per-character level.
* **Virtual Currency** - PlayFab offers up to 10 virtual currencies per title. Currencies can be used to purchase Items from the Catalog or a Store, represent soft currency converted from In App Purchases, or be used as a mechanic to drive gameplay.
* **Segments** - Provides subsets of players grouped by their event history. For example, the "Frequent Players" segment is comprised of players that have logged in more than 100 times.
* **Stores** - Stores serve a subset of Catalog Items; these items can be offered at alternative prices when compared to those set on the corresponding Catalog Items.

Stores contains an array of references to items defined in your catalog, along with the prices for the item, in both real world and virtual currencies. Store prices act as an override to any prices defined in the catalog. In this way, the base definitions of the items may be defined in the catalog, with all associated properties, while the pricing can be set for each store as needed. This allows for subsets of goods to be defined for different purposes, and can be used to:

* Easily organize your in-game storefront.
* Create and organize sales.
* Make the Items available for a set time period.
* Appropriate certain Catalog Items to specific in-game vendors.
* Override the Base Catalog prices for certain player Segments.

Stores are built on top of your game’s Virtual Catalogs and Currencies. Think of your primary Catalog as a definition of all the items in your game, and Stores as an override.

Although you can use the Title Data Management APIs [SetStoreItems](xref:titleid.playfabapi.com.admin.title-widedatamanagement.setstoreitems) and [UpdateStoreItems](xref:titleid.playfabapi.com.admin.title-widedatamanagement.updatestoreitems) to control them programmatically, Stores are normally set up in [Game Manager](../../config/gamemanager/index.md).  