---
title: Best Practices for Store Segmentation
author: v-thopra
description: Lists the Best Practices for configuring and using Store Segmentation.
ms.author: v-thopra
ms.date: 29/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, stores
ms.localizationpriority: medium
---

# Best practices for Store segmentation

- **Store Segmentation** is public information.
  - There are many ways for **Players** to gain information about alternate **Stores**.
  - **Players** naturally transition between **Segments**, and they'll see those changes when they transition.
  - **Players** discuss content on forums, community sites, wikis, etc.
  - In the **PlayFab API**, **Store** information is *public* unless you disable those **APIs** with our [API Access Policy](../../config/gamemanager/api-access-policy.md)
  - You should assume that **Players** will be aware of other **Stores** and their details.

- Provide varying content, *not* varying pricing.
  - **Players** will feel cheated if:
    - Prices go up or down when they transition **Segments**.
    - Prices described on wikis are different than their own.

  - The only exception to the pricing rule would be first time purchases.
    - You must secure the **Client API** methods with our [API Access Policy](../../config/gamemanager/api-access-policy.md) to prevent multiple purchases, or make repurchasing less meaningful through game design.

- Content should be relevant to the **Segment**.
  - Whales are willing to spend large amounts of real money, and are therefor likely to buy more expensive bundles, if the value is worthwhile.
  - First time buyers may be given an option which is a particularly good deal, but can only be (usefully) obtained once.
  - End game **Players** may only be interested in a specific subset of items.
