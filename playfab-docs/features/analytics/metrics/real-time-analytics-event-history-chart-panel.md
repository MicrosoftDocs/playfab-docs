---
title: Real-time analytics - Event History Chart panel
author: v-thopra
description: Illustrates how to use the Event History Chart panel.
ms.author: v-thopra
ms.date: 11/08/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, event history
ms.localizationpriority: medium
---

# Real-time analytics - Event History Chart panel

This tutorial offers you an overview of what it is and how to use the Event History Chart panel.

## Overview

The [**Event History Chart**](event-history.md) panel represents the event flow as a chart of events, distributed over a timeline and grouped by time intervals.

To generate events for testing purposes, see the [Generating PlayStream Events tutorial](playstream-events.md) for examples of how to post custom events.

In the panel example shown below:

1. The **vertical axis** shows the amount of events for each given period of time.
2. The **horizontal axis** represents a timeline, grouped by intervals.
3. The legend is represented as a color map, where each event name is mapped to a certain color.
4. Events are grouped by intervals into columns. Within a certain interval, events are grouped by name (visually by color).
5. Hovering your mouse over a color rectangle reveals additional information about that event group.

![Event History Chart panel](media/tutorials/event-history-chart-panel.png)  

## Tips and tricks

- It is possible to select an interval in the chart, and adjust the chart to reflect only the selected interval.
  
   ![Event History Chart - select interval](media/tutorials/event-history-chart-select-interval.png)  

- As an option, you can select event names in the legend, and show or hide certain event types.

> [!NOTE]
> This will not reload the query.

   ![Event History Chart - click event names](media/tutorials/event-history-chart-click-event-names.png)  
