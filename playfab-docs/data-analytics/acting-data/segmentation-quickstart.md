---
title: Player segmentation
author: joannaleecy
description: Tutorial that describes how to create and use player segmentation.
ms.author: joanlee
ms.date: 10/26/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, segmentation
ms.localizationpriority: medium
---

# Player segmentation quickstart

Player segmentation is defined in [Game Manager](../../gamemanager/quickstart.md). Segments allow you to define useful or interesting groups of players, and perform exclusive actions on that group.

## Requirements

- Players with and without a distinctive characteristic defined in PlayFab.

- A defined [CloudScript PlayStream Hook](../acting-data/action-rules-using-cloudscript-actions-with-playstream.md).

### Example case: Run a custom CloudScript for every player who reaches an in-game goal

The *defining characteristic* of a player might be:

- Login time
- Linked device type
- Tags
- Real-world location
- Statistic values
- Virtual currency values
- Real money purchases, and more.

For this example, our distinctive characteristic will be a statistic - specifically, players who achieve **50 str**.

> [!NOTE]
> Statistics are one of many possible options, and only specifically required for this example. Feel free to replace the statistic requirement with another filter of your choice.

Our action will be to run a CloudScript function. CloudScript is by far the most flexible trigger option, granting you the full control of player and segmentation information at the time of segment transition.

From the **Game Manager** screen:

- Navigate to your **Title**.
- Select **Players** from the menu on the left.
- Move to the **Segments** tab.
- Select **New Segment**.

The screen shown below is an example of the **Segment** described above.

![Game Manager - players - segments - new segment](media/tutorials/game-manager-players-segments-new-segment.png)  

The most complex part of this example is the CloudScript. Utilize the second parameter, *Context*, in your [CloudScript handler](../acting-data/action-rules-using-cloudscript-actions-with-playstream.md) to identify the player, and segment transition.

Afterwards, perform any action you wish on the player, such as granting [inventory items](../../features/data/playerdata/player-inventory.md), [virtual currency](../../features/economy/tutorials/currencies.md), [player data](../../features/data/playerdata/quickstart.md), or [statistics](../../features/data/playerdata/using-player-statistics.md).

See also: [Best Practices for store segmentation](../../features/economy-v2/overview.md)
