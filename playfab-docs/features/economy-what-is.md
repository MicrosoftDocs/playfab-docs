---
title: What is PlayFab Economy?
author: thomasgu
description: Landing page for Economy.
ms.author: thomg
ms.date: 07/01/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, game, items, virtual, currencies, stores, ugc, user generated content
ms.localizationpriority: medium
---

# What is PlayFab Economy?

A virtual economy isn't just buying and selling in-game items. A strong virtual economy encompasses everything from player progression to monetization and engagement and is one of the biggest challenges in game design and architecture.

You need to balance between what can be earned in game and what can be purchased, while supporting both highly engaged players and those players with light engagements. This is all on top of maintaining a highly scalable backend content management system and marketplace redemption abstraction.

PlayFab Economy is a suite of [REST APIs](/rest/api/playfab/economy) with [multiple SDKs](../sdks/playfab-sdk-intro.md) and a portal called [Game Manager](../gamemanager/index.md) with tools to help you build, iterate on, and scale your game while engaging your players.

> [!NOTE]
> Economy v2 GA has released. You can learn more about the differences between v1 and v2 in the [v2 Overview](economy-v2/overview.md).

PlayFab Economy covers various aspects of your game's virtual economy, such as items, currencies, stores, and user-generated content. Here are some of the key concepts and APIs that you need to know:

## Key concepts & APIs

* **[Catalog](economy-v2/catalog/catalog-overview.md)** - Catalogs offer an easy way to manage your game's virtual items. It contains a listing of every item that is available in your game.
* **[Catalog Items](economy-v2/inventory/items-and-inventory-overview.md)** - Catalog Items can represent just about any type of virtual good that you might use, from Durables, to Bundles, to UGC.
* **[Inventory Collections](economy-v2/inventory/index.md)** - Player inventories contain all owned Item Instances.
* **[Virtual Currency](economy/tutorials/currencies.md)** - Currencies can be used to purchase Items from the Catalog or a Store, can represent soft currency converted from In-App Purchases, or can be used as a mechanic to drive game-play.
* **[Stores](economy-v2/stores.md)** - Stores serve up a subset of Catalog Item that can be offered at alternative prices.
* **[User Generated Content](economy-v2/ugc/index.md)** - Empower players to create, upload and search for moderated content. See our [UGC Quickstart](economy-v2/ugc/quickstart.md) for more information on how to begin using PlayFab UGC.

PlayFab Economy also provides a suite of tools to support game economy best practices.
**Our best Practice tools include:**

* **Catalog Search**: V2 has been built from the ground up to support large catalogs, and a key component to that is the SearchItems api which supports filtering, select satements and ordering. For more information, see our documentation on [SearchItems](economy-v2/catalog/search.md).

* **Multiple Currencies**: Most games utilize at least two virtual currencies. Many use a “soft” currency that can be earned in-game through play, and a “hard” currency that can be bought. Having dual currencies gives you more control over your economy, since you can determine which items can be bought. See our tutorial on [Currencies](economy/tutorials/currencies.md).

* **Server-side receipt validation**: To prevent fraud and ensure that the money you think you are making is, in fact, being made. See our [Getting Started with Unity and Android](economy-v2/tutorials/getting-started-with-unity-and-android.md) tutorial.

* **Bundles**: Bundles are useful structures for grouping items, generally to sell virtual goods as a group. See our [Bundles](economy-v2/bundles.md) documentation for more information on how to use Bundles.

* **Virtual Subscriptions**: Use subscriptions to grant time based access to durables. See our [Economy V2 Subscriptions](economy-v2/subscriptions.md) documentation.

* **Transaction History**: The Transaction History API can retrieve all the operations performed on a player's inventory, allowing you to track usage and troubleshoot issues. See our [Economy V2 Collections](economy-v2/inventory/collections.md) documentation.

* **Inventory Collections**: Give your players multiple inventories with this feature. See our [Economy V2 Transaction History](economy-v2/inventory/transaction-history.md) documentation.

* **Inventory Stacks**: Stacks allow inventories to hold stacks of items, or separate and distinct instances of the same item. See our [Economy V2 Stacks](economy-v2/inventory/stacks.md) documentation.
 
* **Deep Links**: With Deep Links you can link directly to your in-game or platform store. See our [Deep Links](economy-v2/catalog/deep-links.md) documentation.

* **Etags**: Etags can be used to manage concurrency during item updates. See our [Etags](economy-v2/catalog/etags.md) documentation.

* **Ratings and Reviews**: Ratings and Reviews can be used to collect player feedback and improve your game’s quality See our [Ratings and Reviews](economy-v2/catalog/ratings.md) documentation.

> [!NOTE]
> If you are interested in the previous version of PlayFab Economy, otherwise known as V1 or Legacy, you can find that documentation here: [Legacy Economy](economy/index.yml)  
