---
title: Tracking title consumption of multiplayer servers
author: v-thopra
description: Describes the tracking data that is available in the Monitoring section of the Multiplayer tab in Game Manager.
ms.author: v-thopra
ms.date: 05/08/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, consumption, monitoring
ms.localizationpriority: medium
---

# Tracking title consumption of multiplayer servers

In the Multiplayer Server tab, there is a “Monitoring” section that you can use to track server consumption. For multiplayer-focused games, server spend can be significant and these tools help you monitor your estimated bill.

The following time-series data is available to you via the monitoring experience:

- **Compute-hour estimates** are provided with a 2-hour delay.
- **Network consumption estimates** are provided with a 24-hour delay.
- **Graph showing compute-hours (y-axis) over time (x-axis)** You can breakdown the data by core type and change time range (from 12 months to 3-days).

The Monitoring experience allows you to view consumption in dollars, but this monetary value is an estimate using online pay-as-you-go pricing.

## Download consumption data

You can download a CSV for consumption graphs in the **Monitoring** section. This breakdown down consumption by individual build for deeper analysis.

Also in the Analytics -> Reports section, similar CSV content aggregating multiplayer server consumption over a rolling 30 day window is available each day. This CSV report breakdowns consumption by individual build, and uses your actual price sheet to provide monetary values.