---
title: Custom Stores for Player Segments
author: v-thopra
description: Tutorial that describes how to create alternate stores that are available only to players from defined Player Segments.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, stores, segmentation
ms.localizationpriority: medium
---

# Custom Stores for Player Segments

In our [Stores and Sales](stores-and-sales.md) tutorial, we demonstrate how to set up a **Store** and make a few items available to a **Player** at special or alternate **Prices**.

In our [Player Segmentation](../../analytics/segmentation/player-segmentation.md) tutorial, we demonstrate how to **Group** your **Player** into **Segments** based on **Player Information** or **Behavior**.

This tutorial lets you *combine* these features, and produce alternate **Stores** available *only* to **Players** from defined **Player Segments**.

First, we need some example **Segments**, so here are some **Segments** that are **Segmented-Store Testing** friendly.

![Game Manager - Players - Segments - Example Segments](media/tutorials/game-manager-players-segments-example-segments.png)  

For the next image, we will reuse the **Equipment Store** created in the [Stores and Sales](stores-and-sales.md) tutorial, and add **Player Segmentation**.

First, you must create each **Store** separately, and give it an identifiable **Name**. Each **Store** should have content that is customized for that **Segment**.

![Game Manager - Economy - Catalogs - Stores](media/tutorials/game-manager-economy-catalogs-stores.png)  

Finally, return to the base **Equipment Store**, and fill in the **Segment Overrides** section at the bottom (This section is *only visible* if there are defined **Player Segments**).

![Game Manager - Edit Store - Segment Overrides](media/tutorials/game-manager-edit-store-segment-overrides.png)  

## Best Practices for Store Segmentation

- **Store Segmentation** is public information:
  - There are many ways for **Player** to gain information about alternate **Stores**.
  - **Players** naturally transition between **Segments**, and they'll see those changes when they transition.
  - **Players** discuss content on **forums**, **community sites**, **wikis**, etc.
  - In the **PlayFab API**, **Store Information** is public unless you disable those **APIs** with our [API Access Policy](../../config/gamemanager/api-access-policy.md).
  - You should assume that **Players** will be aware of other **Stores** and their details.

- Provide varying content, *not* varying pricing:
  - **Players** will feel cheated if: 
    - If **Prices** go up or down when they transition **Segments**.
    - If **Prices** described on **wikis** are different than their own.

  - The *only* exception to the **Pricing Rule** would be *first time* purchases:
    - You must secure the **Client API** methods with our [API Access Policy](../../config/gamemanager/api-access-policy.md) to prevent multiple purchases, or make repurchasing less meaningful through game design.

- Content should be relevant to the **Segment**:
  - Whales are willing to spend large amounts of **Real Money**, and thus are likely to buy more expensive **Bundles**, if the value is worthwhile.
  - First time buyers may be given an option which is a particularly good deal, but can only be (usefully) obtained once.
  - End game **Players** may only be interested in a specific subset of **Items**.
