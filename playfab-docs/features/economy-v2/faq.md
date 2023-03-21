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

**Q: How do I migrate my title from V1 (Legacy) to V2?**
**A:** If you have a live title with existing player data we don’t recommend that you attempt to migrate users today. Although the API and Game Manager surface are similar, migration, especially with live player data, requires diligent engineering. 

If your title isn’t live yet, the process is easier but be aware that there are differences in functionality between the two systems. Those differences are highlighted below and you can learn more about Economy V2 in our updated [Documentation](overview.md). If you're a premium customer you can reach out to us via the support channel. We’d be happy to consult and help you plan if you have questions. 

**Q: What are the differences between V1 (Legacy) and V2?**
**A:** V2 is complete rearchitecture from V1, and there are many important differences. At a high level, the Catalog has changed from being a single document to individual versioned items all of which are in their own document with their own metadata. This allows increased scale for in-game catalogs and intelligent [Search](catalog/search.md) for creating in-game channels of content. All of this requires a different sort of interaction with the catalog. Inventory PlayFab [Inventory](inventory/index.md) has been rearchitected to better handle higher amounts of throughput, higher usage calling patterns, and allow for more stable (and idempotent) transactions. Inventory now natively supports Collections Inventory [Collections](inventory/collections.md) and Stacks [Inventory](inventory/stacks.md). [Stores](stores.md) and sales are also handled differently in the new world.

**Q: Which version of Economy should I use?**
**A:** You should use version 2. Although we aren't deprecating v1 (Legacy) and will maintain and support it for all titles, it's in bugfix-only mode. All new Economy features are being developed only for version 2.

**Q: Does Economy V2 support all of the features from Economy (Legacy)?**
**A:** No, Economy V2 doesn’t have full parity with all of the features PlayFab supports in V1 (Legacy). Some of these features never received the adoption we hoped for in Playfab. Others were lacking the depth and surface area needed to really help developers implement them in their games. Some we plan to deliver in future updates. Specifically today Economy V2 doesn't support PlayFab style Coupons, Limited Items, Recharge Item Rates, Drop Tables, or Store Support for Segments. 
