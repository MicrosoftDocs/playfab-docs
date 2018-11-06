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

![Thirty Day New User Retention Report Table](media/tutorials/thirty-day-new-user-retention-report-table.png)  

The Thirty Day New User Retention Report tracks the percentage of a new user cohort who return to the game on subsequent days. A cohort of players is defined by grouping newly-registered players on a given day (Day 0) and their retention is tracked over a 30-day period. Cohort size indicates the number of players in a cohort.

The preceding example report, was generated on 2/5/2018. On 1/6/2018, 39,132 new players created accounts in the example title. Since Day 0 is an initiation date for a new cohort, this column always has 100% retention rate. Then, 33.84% of those players logged in again the next day, 24.64% in two days later, and so on. 10.84% of the cohort returned on the 30th day, which corresponds to 2/5/2018.

For additional details, see [Metrics and Terminology](../metrics/metrics-and-terminology.md).

## Populating the report

To populate this report, you must register a player and then log in several days in a row, at least once. This, however, will produce trivial results, with 100% retention for each day. Throwing more players into the process and skipping some days will produce more interesting results.

The following API calls may be used to log in:

- [LoginWithAndroidDeviceID](https://api.playfab.com/documentation/client/method/LoginWithAndroidDeviceID)
- [LoginWithCustomID](https://api.playfab.com/documentation/client/method/LoginWithCustomID)
- [LoginWithEmailAddress](https://api.playfab.com/documentation/client/method/LoginWithEmailAddress)
- [LoginWithFacebook](https://api.playfab.com/documentation/client/method/LoginWithFacebook)
- [LoginWithGameCenter](https://api.playfab.com/documentation/client/method/LoginWithGameCenter)
- [LoginWithGoogleAccount](https://api.playfab.com/documentation/client/method/LoginWithGoogleAccount)
- [LoginWithIOSDeviceID](https://api.playfab.com/documentation/client/method/LoginWithIOSDeviceID)
- [LoginWithKongregate](https://api.playfab.com/documentation/client/method/LoginWithKongregate)
- [LoginWithPlayFab](https://api.playfab.com/documentation/client/method/LoginWithPlayFab)
- [LoginWithSteam](https://api.playfab.com/documentation/client/method/LoginWithSteam)
- [LoginWithTwitch](https://api.playfab.com/documentation/client/method/LoginWithTwitch)
- [LoginWithWindowsHello](https://api.playfab.com/documentation/client/method/LoginWithWindowsHello)

To register a player you may use the following API Calls:

- [RegisterPlayFabUser](https://api.playfab.com/documentation/client/method/RegisterPlayFabUser)
- [RegisterWithWindowsHello](https://api.playfab.com/documentation/client/method/RegisterWithWindowsHello)

You may also you use the following API calls to register and log in simultaneously if the CreateAccount flag is set:

- [LoginWithAndroidDeviceID](https://api.playfab.com/documentation/client/method/LoginWithAndroidDeviceID)
- [LoginWithCustomID](https://api.playfab.com/documentation/client/method/LoginWithCustomID)
- [LoginWithFacebook](https://api.playfab.com/documentation/client/method/LoginWithFacebook)
- [LoginWithGameCenter](https://api.playfab.com/documentation/client/method/LoginWithGameCenter)
- [LoginWithGoogleAccount](https://api.playfab.com/documentation/client/method/LoginWithGoogleAccount)
- [LoginWithIOSDeviceID](https://api.playfab.com/documentation/client/method/LoginWithIOSDeviceID)
- [LoginWithKongregate](https://api.playfab.com/documentation/client/method/LoginWithKongregate)
- [LoginWithSteam](https://api.playfab.com/documentation/client/method/LoginWithSteam)
- [LoginWithTwitch](https://api.playfab.com/documentation/client/method/LoginWithTwitch)
