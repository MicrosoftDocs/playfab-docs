---
title: Economy v2 FAQ
author: thomasgu
description: Answers to common V2 questions.
ms.author: thomg
ms.date: 3/16/2023
ms.topic: article
ms.service: playfab
keywords: playfab, commerce, economy, migration, FAQ, parity
ms.localizationpriority: medium
---

# Economy V2 FAQ

[!INCLUDE [notice](../../includes/_economy-release.md)]
**Q: What can you do with PlayFab Economy?**

**A:** PlayFab Economy has many features and options that help you create and manage your game's virtual economy. Here are some of the things you can do with PlayFab Economy:
* Create a catalog of items - You can easily create and manage a large number of virtual items for your in-game store.
* Manage player inventories - You can keep track of what items each player has in their inventory across all of the platforms your game runs on. 
* Create virtual currencies - You can make different types of virtual money that players can use in your game. For example, you can have a "soft" currency that players can earn by playing the game, and a "hard" currency that players can buy with real money.
* Create stores - You can make different stores where players can buy or sell items. You can set different prices for items in different stores, or offer special deals or discounts to players.
* Let players create content - You can use UGC to let players create their own items or content and share it with other players. This makes your game more fun and creative for players.

**Q: How does PlayFab Economy help you?**

**A:** PlayFab Economy has many tools and options that help you follow best practices for creating a virtual economy. Here are some of the ways PlayFab Economy helps you:

* Search for items: You can use PlayFab Economy to search for items in your catalog. This makes it easy to create special in-game views and find what you are looking for.
* Validate receipts: You can use PlayFab Economy to check if players really bought something with real money from a platfrom store. This helps prevent fraud and cheating.
* Create bundles: You can use PlayFab Economy to group items together and sell them as a bundle. This makes it easier for players to buy multiple items at once, such as virtual currency packs of 100, 500, and so on.
* Create virtual subscriptions: You can use PlayFab Economy to let players subscribe to your game or service. This means they pay a regular fee (e.g., every month) to get access to special features or content.
* Track transactions: You can use PlayFab Economy to see all the transactions (e.g., buying or selling items) that happen in your game. This helps you understand how players are using your virtual economy.

**Q: How do I migrate my title from V1 (Legacy) to V2?**

**A:** If you have a live title with existing player data we don’t recommend that you attempt to migrate users today. Although the API and Game Manager surface are similar, migration, especially with live player data, requires diligent engineering. 

If your title isn’t live yet, the process is easier but be aware that there are differences in functionality between the two systems. Those differences are highlighted below and you can learn more about Economy V2 in our updated [Documentation](overview.md). If you're a premium customer you can reach out to us via the support channel. We’d be happy to consult and help you plan if you have questions. 

**Q: What are the differences between V1 (Legacy) and V2?**

**A:** V2 is complete rearchitecture from V1, and there are many important differences. At a high level, the Catalog has changed from being a single document to individual versioned items all of which are in their own document with their own metadata. This allows increased scale for in-game catalogs and intelligent [Search](catalog/search.md) for creating in-game channels of content. All of this requires a different sort of interaction with the catalog. Inventory PlayFab [Inventory](inventory/index.md) has been rearchitected to better handle higher amounts of throughput, higher usage calling patterns, and allow for more stable (and idempotent) transactions. Inventory now natively supports Collections Inventory [Collections](inventory/collections.md) and Stacks [Inventory](inventory/stacks.md). [Stores](stores.md) and sales are also handled differently in the new world.

**Q: Which version of Economy should I use?**

**A:** You should use version 2. Although we aren't deprecating v1 (Legacy) and will maintain and support it for all titles, it's in bugfix-only mode. All new Economy features are being developed only for version 2.

**Q: Does Economy V2 support all of the features from Economy (Legacy)?**

**A:** No, Economy V2 doesn’t have full parity with all of the features PlayFab supports in V1 (Legacy). Some of these features never received the adoption we hoped for in Playfab. Others were lacking the depth and surface area needed to really help developers implement them in their games. Some we plan to deliver in future updates. Specifically today Economy V2 doesn't support PlayFab style Coupons, Limited Items, Recharge Item Rates, Drop Tables, or Store Support for Segments. 
