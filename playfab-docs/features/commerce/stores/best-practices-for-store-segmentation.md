---
title: Best Practices for Store Segmentation
author: v-thopra
description: Lists the Best Practices for configuring and using Store Segmentation.
ms.author: v-thopra
ms.date: 10/29/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, stores
ms.localizationpriority: medium
---

# Best practices for store segmentation

- Store segmentation is public information.
  - There are many ways for players to gain information about alternate stores.
  - Players naturally transition between segments, and they'll see those changes when they transition.
  - Players discuss content on forums, community sites, wikis, etc.
  - In the PlayFab API, store information is *public* unless you disable those APIs with our [API Access Policy](../../config/gamemanager/api-access-policy.md)
  - You should assume that players will be aware of other stores and their details.

- Provide varying content, *not* varying pricing.
  - Players will feel cheated if:
    - Prices go up or down when they transition segments.
    - Prices described on wikis are different than their own.

  - The only exception to the pricing rule would be *first time* purchases.
    - You must secure the client API methods with our [API Access Policy](../../config/gamemanager/api-access-policy.md) to prevent multiple purchases, or make repurchasing less meaningful through game design.

- Content should be relevant to the segment.
  - Whales are willing to spend large amounts of real money, and are therefor likely to buy more expensive bundles, if the value is worthwhile.
  - First time buyers may be given an option which is a particularly good deal, but can *only* be (usefully) obtained once.
  - End game players may only be interested in a specific subset of items.
