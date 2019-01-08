---
title: Player segmentation
author: v-thopra
description: Tutorial that describes how to create and use player segmentation.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, segmentation
ms.localizationpriority: medium
---

# Player segmentation

**Player Segmentation** is defined in [Game Manager](../../config/gamemanager/quickstart.md). **Segments** allow you to define useful or interesting **Groups** of **Players**, and perform exclusive actions on that **Group**.

**Requirements:**

- **Players** with and without a distinctive characteristic defined in **PlayFab**.
- A defined [CloudScript PlayStream Hook](../../automation/actions-rules/using-cloudscript-actions-with-playstream.md).

## Example case: Run a custom CloudScript for every Player who reaches an in-game goal

The *defining characteristic* of a **Player** might be:

- Login time
- Linked device type
- Tags
- Real-world location
- Statistic Values
- Virtual Currency values
- Real money purchases, and more.

For this example, our distinctive characteristic will be a **Statistic**, specifically **Players** who achieve 50 **str**. **Statistics** are one of many possible options, and only specifically required for this example. Feel free to replace the **Statistic** requirement with another filter of your choice.

Our action will be to run a **CloudScript** function. **CloudScript** is by far the most flexible trigger option, granting you full control of the **Player** and **Segmentation** information at the time of **Segment**-transition.

From **Game Manager**:

- Navigate to your **Title**.
- Select **Players** from the menu on the left.
- Move to the **Segments** tab.
- Select **New Segment**.

The screen shown below is an example of the **Segment** described above.

![Game Manager - players - segments - new segment](media/tutorials/game-manager-players-segments-new-segment.png)  

The most complex part of this example is the **CloudScript**. Utilize the second parameter, **Context** in your [CloudScript handler](../../automation/actions-rules/using-cloudscript-actions-with-playstream.md) to identify the **Player**, and **Segment** transition. Afterwards, perform any action you wish on the **Player**, such as granting [inventory items](../../data/playerdata/player-inventory.md), [virtual currency](../../commerce/economy/currencies.md), [player data](../../data/playerdata/quickstart.md), or [statistics](../../data/playerdata/using-player-statistics.md).

See also: [Best Practices for store segmentation](../../commerce/stores/best-practices-for-store-segmentation.md)
