---
title: Daily, Monthly, and Rolling 30-Day Overview and Totals Reports
author: joannaleecy
description: Describes the report that tracks hourly, daily, and monthly logins, revenue, and API usage.
ms.author: joanlee
ms.date: 10/30/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Daily, Monthly, and Rolling Thirty Day Overview and Totals reports

## Introduction

PlayFab offers a set of daily and monthly Key Performance Indicator (KPI) reports, including:

- **Total Logins**
- **Unique Logins**: Daily reports (**DAU**)  or Monthly and Rolling Thirty Day Reports (**MAU**)
- **New Users**
- **Unique Paying Users**
- **Transaction Revenue**
- **Purchases**
- **Total API Calls**
- **Total Successful API Calls**
- **Total API Call Errors**
- **Average Revenue Per User** (**ARPU**)
- **Average Revenue Per Paying User** (**ARPPU**)
- **Average Purchase Price**

An Overview report contains trend charts of each metric during the past 24 hours (daily), past 30 days (rolling 30-day), and in last month (monthly).

A Totals report contains the summary of each metric shown in the overview report. Daily and Rolling Thirty Day reports are generated on a daily basis, whereas Monthly reports are generated on the first day of each month.

Report times are based on Coordinated Universal Time (UTC). For additional details on metrics, see [Metrics and Terminology](../../../features/analytics/metrics/metrics-and-terminology.md).

## Totals reports

Totals reports include a table, which contains the 12 Key Performance metrics described in the introduction.

![Daily Totals Report](media/tutorials/daily-totals-report.png)  

## Overview reports

Overview reports consist of 12 trend charts - one for each metric described in the introduction. Working with charts is described later in this tutorial.

![Daily Overview Report - Logins - Unique Payers](media/tutorials/daily-overview-report-logins-unique-payers.png)  

![Daily Overview Report - Revenue - Purchases - Total Calls](media/tutorials/daily-overview-report-revenue-purchases-total-calls.png)  

![Daily Overview Report - Calls - Errors - Arpu](media/tutorials/daily-overview-report-calls-errors-arpu.png)  

![Daily Overview Report - Arppu - App - New Users](media/tutorials/daily-overview-report-arppu-app-new-users.png)  

## Populating the reports

Any API call may introduce new data for total API calls, total successful API calls, and total API call errors.

- Once executed, an API call will be added to total API calls.
- If there is an error that is introduced, it will be recorded to total API call errors.
- If *no* error is introduced, it will belong to total successful API calls.

Please consult our [PlayFab API Reference documentation](../../../api-references/index.md) to review all available API calls.

The following API calls will introduce new data for total logins and total unique logins:

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
- `LoginWithWindowsHello`<!-- [LoginWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.loginwithwindowshello) -->

The API calls shown below will introduce new data for total new users.

- [RegisterPlayFabUser](xref:titleid.playfabapi.com.client.authentication.registerplayfabuser)
- `RegisterWithWindowsHello`<!-- [RegisterWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.registerwithwindowshello) -->

The API calls shown below will introduce new data for total new users if the **CreateAccount** flag is set.

- [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
- [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
- [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
- [LoginWithGameCenter](xref:titleid.playfabapi.com.client.authentication.loginwithgamecenter)
- [LoginWithGoogleAccount](xref:titleid.playfabapi.com.client.authentication.loginwithgoogleaccount)
- [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
- [LoginWithKongregate](xref:titleid.playfabapi.com.client.authentication.loginwithkongregate)
- [LoginWithSteam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam)
- [LoginWithTwitch](xref:titleid.playfabapi.com.client.authentication.loginwithtwitch)

The unique paying users, revenue, purchases, Average Revenue Per User (ARPU), Average Revenue Per Paying User (ARPPU) and average purchase price metrics are used to analyze purchases and payments.

See the [Non-receipt Payment Processing](../../../features/economy/tutorials/non-receipt-payment-processing.md) tutorial, for more information on conducting payments.

## How to work with report charts

PlayFab report charts all follow the same model:

In the top space of the page, view the report name, time period, and **Prev/Next** buttons to switch between the time periods.

Move your cursor along the timeline in the chart to view the associated interactive data.

![Monthly Overview Report](media/tutorials/monthly-overview-report.png)

Metrics available in the chart timeline include:

- The average number of instances through all the timestamps (AVG).
- The peak value (MAX).
- The lowest value (MIN).
