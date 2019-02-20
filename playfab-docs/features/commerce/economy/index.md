---
title: Economy
author: v-thopra
description: Landing page for Economy.
ms.author: v-thopra
ms.date: 01/25/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, media, coupons, promotions, cloudscript
ms.localizationpriority: medium
---

# Economy

Making your economy work is one of the biggest challenges in games. You want to balance between what can be earned in game and what can be purchased. You want to support highly engaged players and those with light engagements. You want to support different store placements and sales events based on player segments.

## Key concepts  

* **Catalog** - Catalogs offer an easy way to manage your game's virtual items. They are listings of every item that is available in your game.
* **Catalog Items** – PlayFab Items can represent just about any type of virtual good that you might use, from Durables, to Bundles to Locked containers.
* **Inventory** - All accounts (player accounts and character accounts) have an inventory. The inventory contains all owned Item Instances as well as item history.
* **Segments** - Provides subsets of players grouped by their event history. For example, the "Frequent Players" segment is comprised of players that have logged in more than 100 times.  
* **Stores** - Stores serve a subset of Catalog Items; these items can be offered at alternative prices when compared to those set on the corresponding Catalog Items.  
* **Virtual Currency** - PlayFab offers up to 10 virtual currencies per title. Currencies can be used to purchase Items from the Catalog or a Store, can represent soft currency converted from In App Purchases, or can be used as a mechanic to drive gameplay.

PlayFab helps you build out your economy by providing a suite of tools to support game economy best practices. These include:

* **Multiple Currencies**: Most games support at least two virtual currencies. Many use a “soft” currency that can be earned in-game through play, and a “hard” currency that can be bought. Having dual currencies gives you more control over your economy, since you can determine which items can be bought. See our tutorial on [Currencies](currencies.md).

* **Server-side receipt validation**: To prevent fraud and ensure that the money you think you are making is, in fact, being made. See our [Getting Started with In App Purchasing](getting-started-with-unity-iap-android.md) and our [Non-Receipt Payment Processing](non-receipt-payment-processing.md) tutorials.

* **Gathering Data on your economy**: See our [Reports](../../analytics/reports/index.md) section for tutorials on how to measure Conversion, and create Daily and Monthly top Items and Spender reports.

* **Bundles**: Generally, Bundles generate more revenue per transaction, and players feel they are getting a great deal. You can use our Catalog to create and sell bundles of virtual goods. See our [Catalog](../items/catalogs.md) tutorial for more information on how to create and leverage Bundles.

* **Segmentation**: Your players are different, so you don't treat them all the same. With PlayFab you can design your store to offer different items and bundles to different player segments, promoting different items as players progress through your game and their play life-cycle. See our [Custom Stores for player segments](../stores/custom-stores-for-player-segments.md) and [Best practices for store segmentation](../stores/best-practices-for-store-segmentation.md) tutorials.

* **Sales**: You may want to run special sales as part of your events, use limited time discounts, or have limited-time offers for rare items. See our [Stores and Sales](../stores/stores-and-sales.md) tutorials for tips on how to manage these.  

* **A/B Testing**: Stores are also great opportunities for A/B testing. Try mixing up the order of items in the store - the same item will sell differently depending on where it is and how it is displayed. See our tutorial on [A/B testing with Stores and Test Buckets.](../../analytics/ab-testing/ab-testing-with-stores-and-test-buckets.md)

* **Coupons**: Special coupons that players can give to friends or share via social media can drive sales and encourage viral growth. PlayFab supports coupons specifically for this sort of scenario:  [Coupons and Promotions](coupons-and-promotions.md).