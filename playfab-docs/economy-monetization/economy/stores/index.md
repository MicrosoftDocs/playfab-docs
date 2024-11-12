---
title: Stores (Legacy Economy)
author: cybtachyon
description: Landing page for (Legacy Economy) Stores.
ms.author: derekreese
ms.date: 01/25/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, stores
ms.localizationpriority: medium
---

# Stores (Legacy Economy)

[!INCLUDE [notice](../../../includes/_economy-deprecation.md)]

Stores are the best way to let players purchase items in your game. You can use the Game Manager to change the order of items, and adjust prices at any time. Using segments, you can even give special prices to certain players without touching your game code.  
  
## Key concepts

* **Catalog** - Catalogs offer an easy way to manage your game's virtual items. They're listings of every item that is available in your game.  
* **Catalog Items** – PlayFab Items can represent just about any type of virtual good that you might use, from durables, to bundles, to locked containers.  
* **Player Inventory** - All player accounts have an inventory. The inventory contains all of the owned Item Instances and item history to-date.  
* **Character Inventory** - Similar to player inventory, except stored at a per-character level.
* **Virtual Currency** - PlayFab offers up to 10 virtual currencies per title. Currencies can be used to purchase Items from the Catalog or a Store, represent soft currency converted from In App Purchases, or be used as a mechanic to drive gameplay.
* **Segments** - Provides subsets of players grouped by their event history. For example, the "Frequent Players" segment is players that have logged in more than 100 times.
* **Stores** - Stores serve a subset of Catalog Items. These items can be offered at alternative prices when compared to prices set on the corresponding Catalog Items.

Stores contain an array of references to items defined in your catalog along with the prices for the item in both real world and virtual currencies. Store prices act as an override to any prices defined in the catalog.

The base definitions of the items are defined in the catalog while the pricing can be set for each store, allowing for subsets of goods to be defined for different purposes:

* Easily organize your in-game storefront
* Create and organize sales
* Make the Items available for a set time period
* Appropriate certain Catalog Items to specific in-game vendors
* Override the Base Catalog prices for certain player Segments

Stores are built on top of your game's Virtual Catalogs and Currencies. Think of your primary Catalog as a definition of all the items in your game, and Stores as an override.

Although you can use the Title Data Management APIs [SetStoreItems](xref:titleid.playfabapi.com.admin.title-widedatamanagement.setstoreitems) and [UpdateStoreItems](xref:titleid.playfabapi.com.admin.title-widedatamanagement.updatestoreitems) to control them programmatically, Stores are normally set up in [Game Manager](../../../gamemanager/index.md).
