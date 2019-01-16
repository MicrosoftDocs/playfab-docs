---
title: Player Segments
author: v-thopra
description: Describes how to access and configure Player Segments in the PlayFab Game Manager.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, game manager, player data, segments
ms.localizationpriority: medium
---

# Player Segments

**Players** can be collected together into a **Segment**, with the idea that all **Players** in the **Segment** meet certain conditions (filters). Once the **Segment** is defined, you can monitor the total number of **Players** in the **Segment** and run custom actions on those **Players** automatically or manually.

## Access Players Segments

To access **Player Segments**:

- Navigate to **Players (1)** in the menu.
- Select the **Segments** tab **(2)**.

![Game Manager - Players - Access Segments](media/tutorials/game-manager-access-player-segments.png)  

## Overview

The **Segments** page displays the **Segments** that you currently have defined, and offers basic management capabilities.

1. Use the **New Segment (1)** button to create a new **Segment**.
2. The **Segment ID (2)** uniquely identifies the **Segment**.
3. The **Segment Name (3)** identifies the **Player**(**s**).
4. The **Matching Players (4)** area displays the total number of **Players** matching the segment filter.
5. Using the check boxes **(5)** to the left of the screen, you can select certain **Segments**, and **X Delete** or **> Run Task...** custom actions on the chosen **Segments**.

![Game Manager - Players - Segments page](media/tutorials/game-manager-players-segments-page.png)  

For more information about defining **Segments** and the filtering criteria, see our tutorial on [Player Segment configuration](player-segment-configuration.md).

For more information about executing custom code for all **Players** in a **Segment** (as a one-time event, or on a regular schedule), see our tutorial on [Bulk Actions for an Entire Player Segment](../../automation/actions-rules/bulk-actions-for-an-entire-player-segment.md).
