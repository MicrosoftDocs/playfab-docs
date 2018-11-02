---
title: Daily A/B Test KPI Report
author: v-thopra
description: Describes the report that is used to evaluate the effectiveness of your A/B Test experiments.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: gaming
ms.technology: playfab
keywords: playfab
ms.localizationpriority: medium
---

# Daily A/B Test KPI Report

## Overview

![Daily A/B Test KPI Report Table](media/tutorials/daily-ab-test-kpi-report-table.png)

The Daily A/B Test KPI (Key Performance Indicators) report shows the outcome of an A/B test broken down by A and B buckets. The Key Performance Indicators for A/B tests include:

- DAU (Daily Active Users)
- Average Logins Per User
- ARPDAU (Average Revenue per Daily Active User)
- Total number of Transactions
- Total number of Unique Payers
- Average transactions per Payer
- Retention for Day 1, 3, 7, 14 and 30

## Populating the report

The first step in setting up A/B testing, is to create an A/B Test using the PlayFab Game Manager. To do this, navigate to the "Automation" tab **(1)** and select the "A/B Testing" sub-tab **(2)**. Create a new A/B test and configure the test name and user buckets. You can have up to 5 buckets with independent ratios (%).

![Game-Manager - Automation - AB Testing - New AB Test](media/tutorials/game-manager-automation-ab-testing-new-ab-test.png)

Please refer to the [Customer Stores for Player Segments](../../commerce/stores/custom-stores-for-player-segments.md) tutorial for further information on A/B testing with stores that are available only to players from defined player segments.
