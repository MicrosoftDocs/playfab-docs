---
title: Real-time analytics - Event History Chart panel
author: v-thopra
description: Illustrates how to use the Event History Chart panel.
ms.author: v-thopra
ms.date: 08/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, event history
ms.localizationpriority: medium
---

# Real-time analytics - Event History Chart panel

This tutorial illustrates how to use the **Event History Chart** panel.

## Overview

The [**Event History**](event-history.md) **Chart** panel represents the **Event** flow as a **Chart** of **Events** distributed over a timeline and grouped by **Time** intervals.

To generate **Events** for testing purposes, see the [Generating PlayStream Events tutorial](playstream-events.md) for examples of how to post **Custom Events**.

![Event History Chart panel](media/tutorials/event-history-chart-panel.png)  
On this panel:
1. The **vertical axis** shows the amount of **Events** for each given period of **Time**.
2. The **horizontal axis** represents a **timeline**, grouped by **Intervals**.
3. The **Legend** is represented as a color map, where each **Event Name** is mapped to a certain color.
4. **Events** are grouped by **Intervals** into columns. Within a certain **Interval**, **Events** are grouped by **Name** (visually by color).
5. Hovering over a color rectangle reveals *additional information* about that **Event Group**.

## Tips and Tricks

- It is possible to select an **Interval** in the **Chart** and adjust the **Chart** to reflect only the selected **Interval**.
  
   ![Event History Chart - select interval](media/tutorials/event-history-chart-select-interval.png)  

- You can select **Event Names** in the legend to optionally show or hide certain **Event Types**.

> [!NOTE]
> This will not reload the **Query**.

   ![Event History Chart - click event names](media/tutorials/event-history-chart-click-event-names.png)  
