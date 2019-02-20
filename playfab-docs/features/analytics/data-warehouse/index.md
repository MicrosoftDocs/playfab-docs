---
title: Data Warehouse
author: kennethsabotta
description: Data Warehouse overview
ms.author: Kenneth.Sabotta
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab. analytics, data warehouse
ms.localizationpriority: medium
---

# Data Warehouse

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

The PlayFab Data Warehouse is a premium PlayFab offering that provides a central repository for your data, whether it’s generated from our services or imported from an external source. The data warehouse is directly integrated with Game Manager, allowing you to query across multiple data assets in a single location where you control the storage retention period or size. Your events can be joined with other data sets we make available or you may import your own sources such as acquisition channel, social activity, and more.

The PlayFab platform and data warehouse are built on a fast and highly scalable data exploration service for log and telemetry data providing fast indexing and querying on large, diverse data sets. Powered by the Azure Data Explorer Engine, PlayFab data warehouse can handle high throughput of events emitted by games so that you can collect, store and analyze gaming data. The underlying architecture is ideal for quickly identifying trends, patterns, or anomalies in your gaming data. Your data is highly available and secure on Azure's global footprint for massive scalability.

The capabilities include:

1. Use of a powerful SQL-like query language that's optimized for ad-hoc data exploration and analytics.
1. Support for analysis of high volumes of heterogeneous data (structured and unstructured).
1. The ability to accelerate your data integration with multiple data connectors like Power BI or Excel.
1. The ability to import & export your data to/from external platforms and formats.
1. Data privacy and governance managed with GDPR compliance.
1. The ability to create, schedule and monitor custom data pipelines.

To get you started,  here are some really great guides that will walk you though all the things you need to know to use our feature:

## Quickstart

[Data Warehouse quickstart](quickstart.md)

## Tutorials

[Data Warehouse tutorial - administration](administration.md)

[Viewing or analyzing event data with Data Warehouse](view-or-analyze-event-data.md)
