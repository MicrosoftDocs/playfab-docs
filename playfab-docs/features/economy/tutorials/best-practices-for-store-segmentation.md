---
title: Best Practices for Store Segmentation in Economy (Legacy)
author: cybtachyon
description: Lists the Best Practices for configuring and using Store Segmentation with Economy (Legacy).
ms.author: derekreese
ms.date: 10/29/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, stores
ms.localizationpriority: medium
---

# Best practices for store segmentation (Legacy Economy)

[!INCLUDE [notice](../../../includes/_economy-deprecation.md)]

* Store segmentation is public information.
  * There are many ways for players to gain information about alternate stores.
  * Players naturally transition between segments, and see those changes when they transition.
  * Players discuss content on forums, community sites, wikis, etc.
  * In the PlayFab API, store information is _public_, unless you disable those APIs with our [API Access Policy](../../../api-references/api-access-policy.md).
  * You should assume that players will be aware of other stores and their details.

* Provide varying content, _not_ varying pricing.
  * Players will feel cheated if:
    * Prices go up or down when they transition segments.
    * Prices described on wikis are different than their own.
  * The only exception to the pricing rule would be _first time_ purchases.
    * You must secure the Client API methods with our [API Access Policy](../../../api-references/api-access-policy.md) to prevent multiple purchases, or make repurchasing less meaningful through game design.

* Content should be relevant to the segment.
  * Whales are willing to spend large amounts of real money, and are therefore likely to buy more expensive bundles, if the value is worthwhile.
  * First time buyers may be given a good deal, but can _only_ be (usefully) obtained once.
  * End game players may only be interested in specific items.
