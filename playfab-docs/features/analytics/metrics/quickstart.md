---
title: Metrics quickstart
author: v-thopra
description: Quickstart for Metrics.
ms.author: v-kciril
ms.date: 02/12/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics
ms.localizationpriority: medium
---

# Metrics quickstart

There are two primary ways to explore your metrics from PlayFab Game Manager:

- Trends - A collection of graphs visualizing performance over time.
- Reports - Data tables comparing. Covered in detail in the Reports Section.

## Trends Tab

The Trends tab offers an easy way to view and analyze performance across eight key performance indicators:

- MAU
- DAU
- New Players
- Screen Time
- Screen Frequency
- Classic Retention
- Revenue
- Stickiness

The Trends tab is updated once daily at the close of the UTC day. For details on each metric, see Metrics and Terminology. The Trends tab consists of three sections: Filters, the Spark Cards, and the Graphs.

![Trends Tab](media/tutorials/trends-tab.png)

## Filters

At the top, there are three page-level filters that can be applied. Choosing any filter will update all spark cards and graphs to match the current active selection:

**Time:** Choose the time interval to explore, from seven days to six months.
**Platform:** See only data for individual device types such as Android, iPhone, or Windows.  
**Region:** See only data from a specific geographic region. For a complete list of which countries are grouped under each region, see Regions.

> [!NOTE]
> Platform and region filters are not currently supported for Revenue. This will be resolved in a future release.

![Filters](media/tutorials/filters.png)

## Spark cards

The Spark cards are designed to offer an at-a-glance view of the today’s. Each Spark Card consists of a trend line, the actual value from the most recent UTC day, and the trend comparing the most recent value against the period start. Definitions for each are obtained by hovering over the metric or by tapping on a mobile phone.

![Spark Card](media/tutorials/spark-card.png)  

## Graphs

The graphs provide day level trend data for each of the six metrics. In some cases, the combo box in the upper-left can be used to toggle the active metric. For example, the Active Players graph can show either DAU or Rolling 30-Day MAU.  

In the upper right-hand corner, individual lines can be toggled on and off. Doing so dynamically re-scales the y-axis. Additionally, in the Retention Graph, D1 and D7 can be disabled to emphasize variations in D14 and D30. Hover over any data point to display the actual value for the selected day. To the right of each graph, supporting metrics offer additional insights such as the average and/or total for the period.

![Graphs](media/tutorials/graph.png)

## Data Collection

If your title is not collecting device information or sessions events, some components of the Trend Explorer will be unavailable. To enable these, change your settings in the Data Collection tab. See Data Collection for more details.