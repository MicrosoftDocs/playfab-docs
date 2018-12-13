---
title: Thirty Day Retention Report
author: v-thopra
description: Describes the report that tracks the percentages of all active players who return to your game over 30 days.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Thirty Day Retention Report

## Overview

The **Thirty Day Retention Report** table illustrates how many of your **Players** came back to the game within a 30-day period.

A new **Cohort** of **Players** is formed every day, based on all the **Players** (new and returning), who have logged in to your game on a given day (**Day 0**).

**Cohort** size is defined by the number of **Players** included in a **Cohort**. Then each cell shows the percentage of **Players** **(%)** from a given **Cohort** who returned on each subsequent day.

![Thirty Day Retention Report](media/tutorials/thirty-day-retention-report-table.png)  

The preceding example report was generated on **1/24/2018**. In our example, it shows that on **12/25/2017**, 1.38M users logged in.  Then:

- 61.85% of them logged in the *next* day.
- And 55.85% of them logged in *two days later*.
- Finally, 18.6% came *back* 30 days later, which corresponds to the **Report** generate date, **1/24/2018**.

This **Report**, in addition to the [New User Retention Report](thirty-day-new-user-retention-report.md), is especially useful when you are running a **LiveOps Event** and want to check its effect on boosting engagement of existing **Players**.

For additional details, see [Metrics and Terminology](../metrics/metrics-and-terminology.md).

## Populating the Report

To populate this **Report**, you need to register a **Player** and then log in several days in a row, at least once.

This, however, will produce *trivial* results, with 100% retention for each day. Throwing more **Players** into the process and skipping some days will produce more interesting results.

The following **API** calls may be used to log in:

- [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
- [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
- [LoginWithEmailAddress](xref:titleid.playfabapi.com.client.authentication.loginwithemailaddress)
- [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
- [LoginWithGameCenter](xref:titleid.playfabapi.com.client.authentication.loginwithgamecenter)
- [LoginWithGoogleAccount](xref:titleid.playfabapi.com.client.authentication.loginwithgoogleaccount)
- [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
- [LoginWithKongregate](xref:titleid.playfabapi.com.client.authentication.loginwithkongregate)
- [LoginWithPlayFab](xref:titleid.playfabapi.com.client.authentication.loginwithplayfab)
- [LoginWithSteam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam)
- [LoginWithTwitch](xref:titleid.playfabapi.com.client.authentication.loginwithtwitch)
- [LoginWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.loginwithwindowshello)
