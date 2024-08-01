---
title: Daily A/B Test KPI Report
author: joannaleecy
description: Describes the report that is used to evaluate the effectiveness of your A/B Test experiments.
ms.author: joanlee
ms.date: 10/30/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, reports, a/b testing
ms.localizationpriority: medium
---

# Daily A/B test KPI report

The Daily A/B test Key Performance Indicators (KPI) report shows the outcome of an A/B test, broken down by A and B buckets.

![Daily A/B Test KPI Report Table](media/tutorials/daily-ab-test-kpi-report-table.png)

The Key Performance Indicators for A/B tests include:

- **DAU** (Daily Active Users)
- **Average Logins Per User**
- **ARPDAU** (Average Revenue per Daily Active User)
- **Total number of Transactions**
- **Total number of Unique Payers**
- **Average Transactions per Payer**
- **Retention for Day 1, 3, 7, 14 and 30**

## Populating the report

The first step in setting up A/B testing is to create an A/B test using the PlayFab Game Manager. To do this:

1. Select **Automation** from the menu to the left.
2. Go to the **A/B Testing** tab.
3. Create a **New A/B Test** and configure the **A/B test name** and user **Buckets**.

> [!NOTE]
> You can have up to **5 Buckets** with independent ratios (**%**).

![Game-Manager - Automation - AB Testing - New AB Test](media/tutorials/game-manager-automation-ab-testing-new-ab-test.png)

Please refer to the [Customer Stores for Player Segments](../../../features/economy/tutorials/custom-stores-for-player-segments.md) tutorial for further information on A/B testing with stores that are available only to players from defined player segments.
