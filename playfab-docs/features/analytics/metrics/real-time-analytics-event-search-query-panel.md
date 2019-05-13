---
title: Real-time Analytics - Event search query panel
author: v-thopra
description: Illustrates how to use the event search query panel.
ms.author: v-thopra
ms.date: 11/08/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, events
ms.localizationpriority: medium
---

# Real-time Analytics - Event Search Query panel

This tutorial illustrates how to use the Event Search Query panel.

## Overview

Along with other tools for monitoring event flow, PlayFab often exposes the Event Search Query panel, that allows you to filter events by different properties.

On the primary screen shown below:

1. The **Event Search Query** field allows you to enter [query expressions](real-time-analytics-event-queries.md) for filtering.
2. The **Run Query** button will reload the entire **Event** flow to match all the **Query** parameters.
3. The **Query Tips** button opens a small how-to guide on using **Queries** and **Query Builder**.
4. The **Auto-refresh** checkbox will automatically reload the **Event** flow every 10 seconds.
5. The **Query Builder** button expands the **Query Panel** (the area in the image outlined in green), and gives access to advanced **Query** and **Graph** settings.
6. The **Event Name** field lets you filter by a concrete **Event Name**.
7. The **Start date** allows you to set the earliest date.
8. The **End date** allows you to set the latest date.
9. The **Sum by** field is a **Graph** options setting that allows you to set the metric for the vertical axis. By default, the **Event Total Amount** is used.
10. The **Distinct on** field is a **Graph** options setting that allows you to change the grouping of the **Events**. By default, **Events** are grouped by **Name**.

![Event Search Query Panel](media/tutorials/event-search-query-panel.png)  

## Powered by Azure Data Explorer

Event search is powered by [Azure Data Explorer](https://azure.microsoft.com/services/data-explorer/) - a fast and highly scalable data exploration service for log and telemetry data providing fast indexing and querying on large, diverse data sets. For optimized queries, the engine can query millions of records in a few seconds - a demonstrable benefit for games producing high throughput or large volumes of gaming events.  

The Event Search Query field allows you to enter query expressions using a powerful SQL-like query language that's optimized for ad-hoc data exploration and analytics. This SQL like query language is called Kusto and its [documentation](https://docs.microsoft.com/azure/kusto/query/) can be accessed in the Azure Data Explorer [reference documentation](https://docs.microsoft.com/azure/kusto/query/).

## Tips and tricks

- The **Query Builder** panel (the area in the image **outlined in green**), offers help with user input:
  - **Date** settings have **Calendar** buttons (to their right), that open a date-picker pop-up.
  - **Graph** options support auto-complete for **Property Names**.
  - When a **Search Query** is specified, the **Clear Query** button will be available to quickly reset all settings.
- Changing the **Event Name**, **Start date**, or **End date** settings will replace the current **Event Search Query** (as of April 18th 2017).
- The **Sum by** field setting allows you to visualize different metrics using a vertical axis other than **Event count**. A common use case is a set of **Purchase Events**, summed by the **Currency** amount.
- By default, **Events** are grouped by **Time** and then by **Name**. While **Time** grouping is mandatory, the **Distinct on** field setting allows you to change how **Events** are grouped inside one **Time** interval.
