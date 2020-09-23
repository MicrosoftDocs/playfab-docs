---
title: Getting started with Explorer Basic
author: nathankong-microsoft
description: Illustrates how to use Explorer Basic to create queries.
ms.author: nakong
ms.date: 09/22/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, explorer, basic
ms.localizationpriority: medium
---

# Getting started with Explorer Basic

>[! IMPORTANT] 
>The Explorer Feature is in public preview. We anticipate ongoing changes to it as we continue gathering feedback 
and optimizing for customer use.

Explorer Basic is designed to let you quickly discover insights in your event data without requiring query language knowledge. This non-technical query building experience enables users to explore their data quickly. To learn how to write more complex queries, see the [Getting Started with Explorer Advanced](getting-started-with-playfab-explorer-advanced.md) tutorial.

## Authoring custom queries

To begin authoring your own queries in Basic mode, it's important to first understand the shape of the data you're accessing.

### The events.all table

The `events.all` table is the default destination for all incoming events. It is a single semi-structured table with columns for common values such as time & event name. You will quickly become familiar with the EventData column, which contains the full original JSON payload and is useful in almost all queries. You can read the following documentation on the [events.all table](../schemas/events-all.md).

### The anatomy of a query

A query is composed of one or more **Conditions** that are combined via the 'AND' logical operator. A condition is composed of an **Event** from the event.all table.

Conditions can be specified by adding one or more **Clauses**, which is a logical statement composed of a **Variable**, **Operator**, and **Value**. Clauses are combined via the 'AND' logical operator. The Variables listed in the dropdown are populated based upon the Event selected when creating the Condition.

The timeframe of the query can be adjusted by modifying **Start date** and **End date**.

The output of the query can be modified further by adding **Group By**, **Sum by**, and **Unique By** options.

## Sample Queries



## Limits
There are two limits which govern Explorer query usage:
 
1. Max query runtime: An individual query is not permitted to run longer than 30 seconds. If this limit is exceeded, the query will be terminated and you will receive an error message.

2. Interval Usage: Each title is permitted a cumulative total runtime of three minutes per any given 10 minute interval. If this limit is exceeded, you will receive an error message and will need to wait before running additional queries. 

## Data Retention

By default, Explorer queries run on hot storage, which can be configured in the Management tool. Queries that search beyond the data stored in hot storage will have significantly longer run times and may time out.
