---
title: Data Explorer
author: joannaleecy
description: Overview for Data Explorer
ms.author: joanlee
ms.date: 09/22/2020    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights, data explorer
ms.localizationpriority: medium
---

# Data Explorer

## Overview

Data Explorer is the primary window into event data collected by your title and services. The data is stored in PlayFab Insights, an in-development offering designed to provide a complete back-end solution for data and analytics. For more information on the PlayFab Insights vision and strategy, see our [webinar](https://www.youtube.com/channel/UCaCZHrQg_-qPrYIVsTFuUHg). 

This feature provides fast indexing and querying on large, diverse data sets. For optimized queries, the engine can query millions of records in a few seconds - a critical capability for games producing high throughput or large volumes of gaming events.

Data Explorer has two different querying modes - basic and advanced. Basic mode is designed to let you quickly discover insights in your event data without requiring query language knowledge. Advanced mode is designed for more complex queries and deeper insights using the [Kusto query language](/azure/data-explorer/kusto/query/) – a SQL-like language optimized for ad hoc data exploration. 

Explorer Advanced uses a simplified SQL-like language that's easy to pick up and learn. The [intellisense](/azure/data-explorer/write-queries) capabilities make it possible for users of all skill levels to author complex queries and [render](/azure/data-explorer/kusto/query/renderoperator) the results in-line.

Learn how to get started in the [Quickstart](quickstart.md) section. 
