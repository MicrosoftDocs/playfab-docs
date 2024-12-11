---
title: Custom Stores for Player Segments in Economy (Legacy)
author: cybtachyon
description: Tutorial for Economy (Legacy) that describes how to create alternate stores that are available only to players from defined Player Segments.
ms.author: derekreese
ms.date: 10/26/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, stores, segmentation
ms.localizationpriority: medium
---

# Custom stores for player segments (Legacy Economy)

[!INCLUDE [notice](../../../includes/_economy-deprecation.md)]

In our [Stores and Sales](stores-and-sales.md) tutorial, we demonstrate how to set up a store and make a few items available to a player at special or alternate prices.

In our [Player segmentation quickstart](../../analytics/segmentation/quickstart.md), we provide an example of how to group your players into segments, based on player information or behavior.

This tutorial describes how to _combine_ these features, and produce alternate stores available _only_ to players from defined player segments.

1. Let's begin with some example segments. In the screenshot shown below, we've provided some segments that are segmented-store-testing friendly.
  ![Game Manager/Players/Segments/Example Segments](../media/tutorials/game-manager-players-segments-new-segment.png)  
1. Next, we'll reuse the **Equipment Store** created in the [Stores and Sales](stores-and-sales.md) tutorial, and add player segmentation. You must create each store separately and give it an identifiable name. Each store should have content that is customized for that segment.

  > [!TIP]
  > Using the **DUPLICATE** feature on the **Stores** screen, you can duplicate stores quickly, and then modify the **Store Id**, **Store name**, and other parameters to make the new store unique.  
  The following screen shot shows our customized stores.

  ![Game Manager/Economy/Catalogs/Stores](../media/tutorials/game-manager-economy-catalogs-stores.png)  

1. Finally, edit the **Equipment Store**, and fill in the **SEGMENT OVERRIDES** section at the bottom (this section is _only visible_ if there are defined player segments).

  ![Game Manager/Edit Store/Segment Overrides](../media/tutorials/game-manager-edit-store-segment-overrides.png)  

## Best Practices for store segmentation

* Store segmentation is public information:
  * There are many ways for players to gain information about alternate stores.
  * Players naturally transition between segments, and they'll see those changes when they transition.
  * Players discuss content on forums, community sites, wikis, etc.
  * In the PlayFab API, store information is _public_ unless you disable those APIs with our [API Access Policy](../../../api-references/api-access-policy.md).
  * You should assume that players will be aware of other stores and their details.

* Provide varying content, _not_ varying pricing:
  * Players will feel cheated if:
    * Prices go up or down when they transition segments.
    * Prices described on wikis are different than their own.
  * The only exception to the pricing rule would be _first time_ purchases:
    * You must secure the client API methods with our [API Access Policy](../../../api-references/api-access-policy.md) to prevent multiple purchases, or make repurchasing less meaningful through game design.

* Content should be relevant to the segment:
  * Whales are willing to spend large amounts of real money _and are likely to buy expensive bundles_ if the value is worthwhile.
  * First time buyers may be given a good deal, but can _only_ be (usefully) obtained once.
  * End game players may only be interested in a specific subset of items.
