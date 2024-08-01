---
title: Thirty-day New User Conversion Report
author: joannaleecy
description: Describes the report that tracks the percentages of new players who spend money within the first 30 days.
ms.author: joanlee
ms.date: 10/30/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Thirty Day New User Conversion report

The Thirty Day New User Conversion report illustrates the percentage of players in a given Cohort who spent money in the game during their first 30 days.

A Cohort of players is formed every day by grouping newly-registered players. Cohort size is indicated by the number of players in a cohort.

> [!NOTE]
> Unlike Retention reports, the Conversion report tracks a cumulative total of players who converted within a given time span.

The example report shown below was generated on **2/13/2018**. On **1/14/2018** under the **Cohort** column, **77,532** new players created accounts in the example title.

![thirty-day New User Conversion Report Table](media/tutorials/thirty-day-new-user-conversion-report-table.png)

Under the **Day 0** column of that date, **0.50%** of these players made at least *one* transaction in the game.

Since conversion reflects a *cumulative* total of players, these percentage values increase along the time span, and reach **1.07%** on the **30th Day** - which corresponds to the report generation date, **2/13/2018**.

For additional details, see [Metrics and Terminology](../../../features/analytics/metrics/metrics-and-terminology.md).

## Populating the report

To populate this report, you must register a new user, log in, and then conduct purchases several days in a row.

This, however, will produce trivial results, (with user conversion at **100%** for each day). Throwing in several users and skipping some days will produce more interesting results.

The following API calls may be used to create new user accounts:

- [RegisterPlayFabUser](xref:titleid.playfabapi.com.client.authentication.registerplayfabuser)
- `RegisterWithWindowsHello`<!-- [RegisterWithWindowsHello](xref:titleid.playfabapi.com.client.authentication.registerwithwindowshello) -->

The following API calls will also create a new user account and log you in automatically, if the `CreateAccount` flag is present:

- [LoginWithAndroidDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithandroiddeviceid)
- [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
- [LoginWithFacebook](xref:titleid.playfabapi.com.client.authentication.loginwithfacebook)
- [LoginWithGameCenter](xref:titleid.playfabapi.com.client.authentication.loginwithgamecenter)
- [LoginWithGoogleAccount](xref:titleid.playfabapi.com.client.authentication.loginwithgoogleaccount)
- [LoginWithIOSDeviceID](xref:titleid.playfabapi.com.client.authentication.loginwithiosdeviceid)
- [LoginWithKongregate](xref:titleid.playfabapi.com.client.authentication.loginwithkongregate)
- [LoginWithSteam](xref:titleid.playfabapi.com.client.authentication.loginwithsteam)
- [LoginWithTwitch](xref:titleid.playfabapi.com.client.authentication.loginwithtwitch)

Finally, you may use following API calls to log in:

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
