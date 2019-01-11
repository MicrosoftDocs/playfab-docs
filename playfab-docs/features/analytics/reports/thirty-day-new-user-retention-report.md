---
title: Thirty Day New User Retention Report
author: v-thopra
description: Describes the report that tracks the percentages of new players who return to your game over the first 30 days.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Thirty Day New User Retention Report

## Overview

The **Thirty Day New User Retention Report** tracks the percentage of a **New User Cohort** who return to the game on subsequent days.

A **Cohort** of **Players** is defined by grouping newly registered **Players** on a given day (**Day 0**) and their **Retention** is tracked over a 30-day period.

**Cohort** size indicates the number of **Players** in a **Cohort**.

![Thirty Day New User Retention Report Table](media/tutorials/thirty-day-new-user-retention-report-table.png)  

The **Thirty Day New User Retention Report** tracks the percentage of a **New User Cohort** who return to the **Game** on subsequent days.

A **Cohort** of **Players** is defined by grouping newly-registered **Players** on a given day (**Day 0**) and their retention is tracked over a **30-day** period. **Cohort** size indicates the number of **Players** in a **Cohort**.

The preceding example **Report**, was generated on **2/5/2018**. On **1/6/2018**, **39,132** new **Players** created accounts in the example **Title**.

Since **Day 0** is an initiation date for a new **Cohort**, this column always has **100%** retention rate.

Then **33.84%** of those **Players** logged in again the *next day*, **24.64%** in *two days* later, and so on. **10.84%** of the **Cohort** returned on the *30th day*, which corresponds to **2/5/2018**.

For additional details, see [Metrics and Terminology](../metrics/metrics-and-terminology.md).

## Populating the Report

To populate this **Report**, you must register a **Players** and then log in several days in a row, at least once.

This, however, will produce trivial results, with **100%** retention for each day.

Throwing more **Players** into the process and skipping some days will produce more interesting results.

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

To register a **Player** you may use the following **API** calls:

- [RegisterPlayFabUser](xref:titleid.playfabapi.com.client.authentication.registerplayfabuser)
- [RegisterWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.registerwithwindowshello)

You may also you use the following **API** calls to register and log in simultaneously if the **CreateAccount** flag is set:

- [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
- [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
- [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
- [LoginWithGameCenter](xref:titleid.playfabapi.com.client.authentication.loginwithgamecenter)
- [LoginWithGoogleAccount](xref:titleid.playfabapi.com.client.authentication.loginwithgoogleaccount)
- [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
- [LoginWithKongregate](xref:titleid.playfabapi.com.client.authentication.loginwithkongregate)
- [LoginWithSteam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam)
- [LoginWithTwitch](xref:titleid.playfabapi.com.client.authentication.loginwithtwitch)
