---
title: Real-time Analytics - Event search query panel
author: v-thopra
description: Illustrates how to use the event search query panel.
ms.author: v-thopra
ms.date: 08/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, events
ms.localizationpriority: medium
---

# Real-time Analytics - Event search query panel

This tutorial illustrates how to use the event search query panel.

## Overview

Along with other tools for monitoring event flow, PlayFab often exposes event search query panel that lets you filter events by different properties:

![Event Search Query Panel](media/tutorials/event-search-query-panel.png)  

1. The Event search query field, allows you to enter [query expressions](real-time-analytics-event-queries.md) for filtering.
2. The Run Query button will reload the entire event flow to match all the query parameters.
3. The Query Tips button opens a small how-to guide on using queries and query builder.
4. The Auto-refresh checkbox, will automatically reload the event flow every 10 seconds.
5. The Query Builder button expands the Query Panel (the area in the image **outlined in green**) and gives access to advanced query and graph settings.
6. The Event name field lets you filter by a concrete event name.
7. Start date allows you to set the earliest date.
8. End date allows you to set the latest date.
9. Sum by field is a Graph options setting, that allows you to set the metric for the vertical axis. By default, event total amount is used.
10. Distinct on field is a Graph options setting that allows you to change the grouping of the events. By default, events are grouped by name.

## Tips and Tricks

- The Query Builder panel (the area in the image **outlined in green**) offers help with user input:
  - Date settings have calendar buttons (to their right) that open a date-picker popup.
  - Graph options support auto-complete for property names.
  - When a search query is specified, the Clear Query button will be available to quickly reset all settings.
- Changing the event name, start date, or end date settings will replace the current event search query (as of April 18th 2017).
- The Sum by field setting allows you to visualize different metrics using a vertical axis other than event count. A common use case is a set of purchase events summed by the currency amount.
- By default, events are grouped by time and then by name. While time grouping is mandatory, the Distinct on field setting allows you to change how events are grouped inside one time interval.