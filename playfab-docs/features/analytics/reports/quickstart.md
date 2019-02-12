---
title: Reports quickstart
author: v-thopra
description: Describes how to access the Game Manager reports composed from events, and broken down by dates.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Reports quickstart

The **Reports** page gives you access to various **Reports** composed from **Events**, and broken down by dates.

> [!IMPORTANT]
> Before using **Reports**, make sure you have executed some **API** calls which have been captured by the **Reports** system already.

## Access Reports

To **access** the **Reports** page:

1. Use the sidebar menu and navigate to **Analytics (1)**.
2. Select the **Reports** tab **(2)**.

![Game Manager - Analytics - Reports](media/tutorials/game-manager-analytics-open-reports.png)  

## Reports overview

The following shows an overview of the **Reports** page.

![Game Manager - Analytics - Reports](media/tutorials/game-manager-analytics-reports-overview.png)  

1. Filter selection allows you to filter **Reports** by **Type** (**Name**).
2. The **Report date** column lists the time intervals for all **Reports** that have been  generated. You can select the **Date** label to access **Reports** details for this specific **Date**.
3. The **Report Name** column identifies the **Report Type** uniquely. You can select the **Name** label to access **Reports** details for the corresponding **Date (2)**.
4. When **Report** data is available, you can download a **CSV** representation of the data by selecting **Download CSV**.
5. When **Reports** data is *not* available for a given day (no **Events** that day), the date and name labels will render black, not selectable, and downloading as **CSV** will not be available.

## Report Types

- [Daily, Monthly, and Rolling 30-Day Overview and Totals Reports](daily-monthly-and-rolling-30-day-overview-and-totals-reports.md)
  - Tracks hourly, daily, and monthly logins, revenue, and API usage.
- [Thirty-day Retention Report](thirty-day-retention-report.md)
  - Tracks the percentages of all active **Players** who return to your **Game** over 30 days.
- [Thirty-day New User Retention Report](thirty-day-new-user-retention-report.md)
  - Tracks the percentages of new **Players** who return to your **Game** over the first 30 days.
- [Thirty-day New User Conversion Report](thirty-day-new-user-conversion-report.md)
  - Tracks the percentages of new **Players** who spend money within the first 30 days.
- [Daily and Monthly Top Spender Report](daily-and-monthly-top-spender-report.md)
  - Tracks the top 100 spenders in your **Game**.
- [Daily and Monthly Top Items Report](daily-and-monthly-top-items-report.md)
  - Tracks the top 100 items in your **Game**.
- [Daily AB Test KPI Report](daily-ab-test-kpi-report.md)
  - Use this report to evaluate the effectiveness of your **A/B Test** experiments.
- [Daily API Usage Details Report](daily-api-usage-details-report.md)
  - Tracks the **PlayFab API** calls used by your **Title**.
- [Daily and Monthly CDN Usage Report](daily-and-monthly-cdn-usage-report.md)
  - Tracks **Content Delivery Network** (**CDN**) usage by your **Players**.
- [Daily Abuse Reports History Report](daily-abuse-reports-history-report.md)
  - This is the place for you to read **Player** bug reporting, and/or to let **Players** report each other for cheating.
  - > [!NOTE]
    > The **Name** column is never selectable on this **Report**, but the **Download CSV** column will *still* work if there is data present.
