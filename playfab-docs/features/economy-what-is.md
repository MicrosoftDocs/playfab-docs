---
title: What is PlayFab Economy?
author: cybtachyon
description: Landing page for Economy.
ms.author: derekreese
ms.date: 09/07/2022
ms.topic: article
ms.service: playfab
keywords: playfab, commerce, economy, media, coupons, promotions, cloudscript
ms.localizationpriority: medium
---

# What is PlayFab Economy?

A virtual economy is not just buying and selling in-game items. A strong virtual economy encompasses everything from player progression to monetization and engagement and is one of the biggest challenges in game design and architecture.

You need to balance between what can be earned in game and what can be purchased, while supporting both highly engaged players and those with light engagements. You want to support different store placements and sales events based on player segments.

This is all on top of maintaining a highly scalable backend content management system and marketplace redemption abstraction.

PlayFab Economy is a suite of [REST APIs](/rest/api/playfab/economy) with [multiple SDKs](../sdks/playfab-sdk-intro.md) and [Game Manager](../gamemanager/index.md) GUI tools to help you build, iterate on, scale, and continue to engage your players while solving the problems not directly related to game design and game systems development.

> [!NOTE]
> Economy v2 Public Preview has released. You can learn more about the differences between v1 and v2 in the [v2 Overview](economy-v2/overview.md).

## Key concepts & APIs

* **[Catalog](economy/items/catalogs.md)** - Catalogs offer an easy way to manage your game's virtual items. They are listings of every item that is available in your game.
* **[Catalog Items](economy/items/index.md)** - Catalog Items can represent just about any type of virtual good that you might use, from Durables, to Bundles, to Locked containers.
* **[Inventory](economy/items/index.md)** - All accounts (player accounts and character accounts) have an inventory. The inventory contains all owned Item Instances as well as each item's history.
* **[Stores](economy/stores/index.md)** - Stores serve a subset of Catalog Items; these items can be offered at alternative prices when compared to those set on the corresponding Catalog Items.  
* **[Store Segments](economy/tutorials/best-practices-for-store-segmentation.md)** - Provides subsets of players grouped by their event history. For example, the "Frequent Players" segment is comprised of players that have logged in more than 100 times.
* **[Virtual Currency](economy/tutorials/currencies.md)** - Economy v1 offers up to 10 virtual currencies per title, while v2 offers 1000s. Currencies can be used to purchase Items from the Catalog or a Store, can represent soft currency converted from In-App Purchases, or can be used as a mechanic to drive game-play.
* **[User Generated Content (v2 only)](economy-v2/ugc/index.md)** - Empower players to create, upload and search for moderated content. See our [UGC Quickstart](economy-v2/ugc/quickstart.md) for more information on how to begin using PlayFab UGC.

PlayFab helps you build out your economy by providing a suite of tools to support game economy best practices.
**Our best Practice tools include:**

* **Multiple Currencies**: Most games utilize at least two virtual currencies. Many use a “soft” currency that can be earned in-game through play, and a “hard” currency that can be bought. Having dual currencies gives you more control over your economy, since you can determine which items can be bought. See our tutorial on [Currencies](economy/tutorials/currencies.md).

* **Server-side receipt validation**: To prevent fraud and ensure that the money you think you are making is, in fact, being made. See our [Getting Started with In App Purchasing](economy/tutorials/getting-started-with-unity-iap-android.md) and our [Non-Receipt Payment Processing](economy/tutorials/non-receipt-payment-processing.md) tutorials.

* **Gathering Data on your economy**: See our [Reports](analytics/reports/index.md) section for tutorials on how to measure Conversion, and create Daily and Monthly top Items and Spender reports.

* **Bundles**: Generally, Bundles generate more revenue per transaction, and players feel they are getting a great deal. You can use our Catalog to create and sell bundles of virtual goods. See our [Catalog](economy/items/catalogs.md) tutorial for more information on how to create and leverage Bundles.

* **Segmentation**: Your players are different, so you don't treat them all the same. With PlayFab you can design your store to offer different items and bundles to different player segments, promoting different items as players progress through your game and their play life-cycle. See our [Custom Stores for player segments](economy/tutorials/custom-stores-for-player-segments.md) and [Best practices for store segmentation](economy/tutorials/best-practices-for-store-segmentation.md) tutorials.

* **Sales**: You may want to run special sales as part of your events, use limited time discounts, or have limited-time offers for rare items. See our [Stores and Sales](economy/tutorials/stores-and-sales.md) tutorials for tips on how to manage these.  

* **A/B Testing**: Stores are also great opportunities for A/B testing. Try mixing up the order of items in the store - the same item will sell differently depending on where it is and how it is displayed. See our tutorial on [A/B testing with Stores and Test Buckets.](analytics/ab-testing/ab-testing-with-stores-and-test-buckets.md)

* **Coupons**: Special coupons that players can give to friends or share via social media can drive sales and encourage viral growth. PlayFab supports coupons specifically for this sort of scenario:  [Coupons and Promotions](economy/tutorials/coupons-and-promotions.md).
