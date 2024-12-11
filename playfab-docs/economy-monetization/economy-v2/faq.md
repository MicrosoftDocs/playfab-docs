---
title: Economy version 2 (V2) FAQ
author: thomasgu
description: Answers to common Economy V2 questions.
ms.author: thomg
ms.date: 3/16/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, migration, FAQ, parity
ms.localizationpriority: medium
---

# Economy V2 FAQ

[!INCLUDE [notice](../../includes/_economy-release.md)]

## General Economy questions

**Q: What can you do with PlayFab Economy?**

**A:** PlayFab Economy has many features and options that help you create and manage your game's virtual economy. Here are some of the things you can do with PlayFab Economy.

* Create a catalog of items - Easily create and manage a large number of virtual items for your in-game store.
* Manage player inventories - Keep track of what items each player has in their inventory across all of the platforms your game runs on.
* Create virtual currencies - Make different types of virtual money that players can use in your game. For example, you can have a "soft" currency that players can earn by playing the game, and a "hard" currency that players can buy with real money.
* Create stores - Make different stores where players can buy or sell items. You can set different prices for items in different stores, or offer special deals or discounts to players.
* Let players create content - Use User Generated Content (UGC) to let players create their own items or content and share it with other players. UGC makes your game more fun and creative for players.

**Q: How does PlayFab Economy help you?**

**A:** PlayFab Economy has many tools and options that help you follow best practices for creating a virtual economy. Here are some of the ways PlayFab Economy helps you.

* Search for items: Use PlayFab Economy to search for items in your catalog. Search makes it easy to create special in-game views and find what you are looking for.
* Validate receipts: Use PlayFab Economy to check if players really bought something with real money from a platform store. Receipt Validation helps prevent fraud and cheating.
* Create bundles: Use PlayFab Economy to group items together and sell them as a bundle. Bundles make it easier for players to buy multiple items at once, such as virtual currency packs of 100, 500, and so on.
* Create virtual subscriptions: Use PlayFab Economy to let players subscribe to your game or service. Subscriptions mean players pay a regular fee (for example, every month) to get access to special features or content.
* Track transactions: Use PlayFab Economy to see all the transactions (for example, buying or selling items) that happen in your game. Reporting and analytics help you understand how players are using your virtual economy.

## Differences between Economy V2 and Economy V1 (Legacy)

**Q: How do I migrate my title from V1 (Legacy) to V2?**

**A:** If you have a live title with existing player data, we don’t recommend that you attempt to migrate users today. Although the API and Game Manager surface are similar, migration, especially with live player data, requires diligent engineering.

If your title isn’t live yet, the process is easier but there are differences in functionality between the two systems. Those differences are highlighted in this FAQ. To learn more about Economy V2, see [Economy overview](overview.md). If you're a premium customer, reach out to us via the support channel. We’d be happy to consult and help you plan if you have questions.

**Q: What are the differences between V1 (Legacy) and V2?**

**A:** V2 is complete rearchitecture from V1, and there are many important differences. At a high level, the Catalog has changed from being a single document to individual versioned items all of which are in their own document with their own metadata. Catalog (V2) allows increased scale for in-game catalogs and intelligent [Search](catalog/search.md) for creating in-game channels of content. V2 requires a different pattern of interaction with the catalog compared to V1. Inventory PlayFab [Inventory](inventory/index.md) has been rearchitected to better handle higher amounts of throughput, higher usage calling patterns, and allow for more stable (and idempotent) transactions. Inventory now natively supports [Collections](inventory/collections.md) and [Stacks](inventory/stacks.md). [Stores](stores.md) and sales are also handled differently in V2.

**Q: Which version of Economy should I use?**

**A:** You should use V2 if you can. Although we aren't deprecating V1 (Legacy) and maintain and support it for all titles, it's in bugfix-only mode. All new Economy features are being developed only for V2.

**Q: Does Economy V2 support all of the features from Economy V1 (Legacy)?**

**A:** No, Economy V2 doesn’t have full parity with all of the features PlayFab supports in V1 (Legacy). Some of these features never received the adoption we hoped for in Playfab. Others were lacking the depth and surface area needed to really help developers implement them in their games. Some we plan to deliver in future updates. Specifically today Economy V2 doesn't support PlayFab style Coupons, Limited Items, Recharge Item Rates, Drop Tables, or Store Support with Segments.

## Marketplace and platform integrations

**Q: Does PlayFab help with Platform Enforcement, such as virtual currency restrictions or sharing entitlements between platforms?**

**A:** Our goal with Economy is to make enabling cross platform entitlements easy for titles to manage, and also make it easy when that sharing isn't allowed. Our features allow you to link a single virtual catalog item to multiple different platform entitlements to ease item management and enable 'Buy Once Play Anywhere scenarios.' You can also, instead, silo virtual currencies, and have multiple separate player inventories, to isolate purchases to comply with different platform obligations. Although the platform features help this way, we don't police or enforce platform policies, it's up to you to implement platform policies for your title.

**Q: Does the platform help abstract away the storefronts of multiple platforms behind a single API?**

**A:** Yes. We’ve set up Economy V2 Bundles to be linkable to items on multiple different platforms. You can use platforms to consolidate receipt validation and redemption scenarios. You can then use our APIs universally to populate your in-game store, regardless of what the platform is and with little platform specific code post-authorization.
