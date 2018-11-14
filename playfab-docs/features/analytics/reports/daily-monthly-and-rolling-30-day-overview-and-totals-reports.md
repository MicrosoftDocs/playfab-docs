---
title: Daily, Monthly, and Rolling 30-Day Overview and Totals Reports
author: v-thopra
description: Describes the report that tracks hourly, daily, and monthly logins, revenue, and API usage.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Daily, Monthly, and Rolling 30-Day Overview and Totals Reports

## Introduction

PlayFab offers a set of daily and monthly Key Performance Indicator (KPI) reports, including:

- Total Logins
- Unique Logins: DAU (daily reports) or MAU (monthly and rolling 30-day reports)
- New Users
- Unique Paying Users
- Transaction Revenue
- Purchases
- Total API Calls
- Total Successful API Calls
- Total API Call Errors
- Average Revenue Per User (ARPU)
- Average Revenue Per Paying User (ARPPU)
- Average Purchase Price

An **Overview Report** contains trend charts of each metric during the past 24 hours (daily), past 30 days (rolling 30-day), and in last month (monthly). 

A **Totals Report** contains the summary of each metric shown in the Overview Report. Daily and rolling 30-day reports are generated on a daily basis, whereas monthly reports are generated on the first day of each month.

Report times are based on Coordinated Universal Time (UTC). For additional details on metrics, see [Metrics and Terminology](../metrics/metrics-and-terminology.md).

## Totals Report

Totals reports contain a table which contains the 12 key performance metrics described in the introduction.

![Daily Totals Report](media/tutorials/daily-totals-report.png)  

## Overview Report

Overview reports consist of 12 trend charts, one for each metric described in the introduction. Working with charts is described later in this tutorial.

![Daily Overview Report - Logins - Unique Payers](media/tutorials/daily-overview-report-logins-unique-payers.png)  

![Daily Overview Report - Revenue - Purchases - Total Calls](media/tutorials/daily-overview-report-revenue-purchases-total-calls.png)  

![Daily Overview Report - Calls - Errors - Arpu](media/tutorials/daily-overview-report-calls-errors-arpu.png)  

![Daily Overview Report - Arppu - App - New Users](media/tutorials/daily-overview-report-arppu-app-new-users.png)  

## Populating the reports

Any API call may introduce new data for *Total API Calls*, *Total Successful API Calls* and *Total API Call Errors*. Once executed, an API call will be added to *Total API Calls*. Then, if an error is introduced, it will be recorded to *Total API Call Errors*. Otherwise, it will belong to *Total Successful API Calls*.

Please, consult our [PlayFab API Reference documentation](../../../api-references/index.md) to review all available API calls.

The following API calls will introduce new data for *Total Logins* and *Total Unique Logins*:

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

The following API calls will introduce new data for *Total New Users*:

- [RegisterPlayFabUser](xref:titleid.playfabapi.com.client.authentication.registerplayfabuser)
- [RegisterWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.registerwithwindowshello)

The following API calls will introduce new data for *Total New Users* if the CreateAccount flag is set:

- [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
- [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
- [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
- [LoginWithGameCenter](xref:titleid.playfabapi.com.client.authentication.loginwithgamecenter)
- [LoginWithGoogleAccount](xref:titleid.playfabapi.com.client.authentication.loginwithgoogleaccount)
- [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
- [LoginWithKongregate](xref:titleid.playfabapi.com.client.authentication.loginwithkongregate)
- [LoginWithSteam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam)
- [LoginWithTwitch](xref:titleid.playfabapi.com.client.authentication.loginwithtwitch)

The *Unique Paying Users*, *Revenue*, *Purchases*, *Average Revenue Per User (ARPU)*, *Average Revenue Per Paying User (ARPPU)* and *Average Purchase Price* metrics are used to analyze purchases and payments. See the [Non-receipt Payment Processing](../../commerce/economy/non-receipt-payment-processing.md) tutorial for more information on conducting payments.

## How to work with report charts

![Monthly Overview Report](media/tutorials/monthly-overview-report.png)  

PlayFab Report Charts all follow the same model. In the top space of the page, you usually get a control panel **(1)**. The control panel contains a report name, observed time period, and "Prev/Next" buttons to switch between the time periods.

Chart panel **(2)** shows the available data as a chart, where the horizontal axis corresponds to the time flow, and the vertical axis corresponds to the number of relevant instances, such as API calls, purchases, users, and so on, depending on the report type.

There are some metrics available below the chart panel **(3)**. Those contain the sum of all the instance across the time period (SUM), the average number of instances through all the timestamps (AVG), the peak value (MAX), and the lowest value (MIN).
