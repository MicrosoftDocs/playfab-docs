---
title: Reports Quickstart
author: v-thopra
description: Demonstrates how to get a player's Value to Date (VTD) from their Player Profile.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Reports quickstart

The **Reports** page gives you access to various **Reports** composed from **Events** and broken down by dates.

> [!IMPORTANT]
> Before using **Reports**, make sure you have already executed some **API** calls, that are captured by the **Report** system.

## Access Reports

To access the **Reports** page:

- Use the sidebar menu and select **Analytics (1)**.
- Select the **Reports** tab **(2)**.
- The **Reports** screen will appear.

![Game Manager - Analytics - Reports](media/tutorials/game-manager-analytics-open-reports.png)  

## Reports overview

In the **Reports** screen shown below:

1. The filter selection drop-down menu field allows you to filter **Reports** by type (**Name**).
2. The **Date** column indicates the time interval for which the **Report** was generated.
   - You can select the **Date** label to access **Report** details for this specific **Date**.
3. The **Name** column identifies the **Report** type uniquely.
   - You can select the **Name** label to access **Report** details for the corresponding **Date (2)**.
4. When **Report** data is available, you can download a **CSV** representation of the data by selecting **Download CSV**.
5. When **Report** data is not available for a given day (no events that day), the **Date** and **Name** labels will be blacked out (not selectable), and downloading as **CSV** will not be available.

![Game Manager - Analytics - Reports](media/tutorials/game-manager-analytics-reports-overview.png)  

## Report types

- [Daily, Monthly, and Rolling 30-Day Overview and Totals Reports](daily-monthly-and-rolling-30-day-overview-and-totals-reports.md)
  - Tracks hourly, daily, and monthly logins, revenue, and **API** usage.
- [Thirty Day Retention Report](thirty-day-retention-report.md)
  - Tracks the percentages of all active **Players** who return to your game over 30 days.
- [Thirty Day New User Retention Report](thirty-day-new-user-retention-report.md) 
  - Tracks the percentages of new **Players** who return to your game over the first 30 days.
- [Thirty Day New User Conversion Report](thirty-day-new-user-conversion-report.md) 
  - Tracks the percentages of new **Players** who spend money within the first 30 days.
- [Daily and Monthly Top Spender Report](daily-and-monthly-top-spender-report.md)
  - Tracks the top 100 spenders in your game.
- [Daily and Monthly Top Items Report](daily-and-monthly-top-items-report.md) 
  - Tracks the top 100 items in your game.
- [Daily AB Test KPI Report](daily-ab-test-kpi-report.md)
  - Use this report to evaluate the effectiveness of your **A/B Test** experiments.
- [Daily API Usage Details Report](daily-api-usage-details-report.md) 
  - Tracks the **PlayFab API** calls used by your title.
- [Daily and Monthly CDN Usage Report](daily-and-monthly-cdn-usage-report.md)
  - Tracks **Content Delivery Network** (**CDN**) usage by your **Players**.
- [Daily Abuse Reports History Report](daily-abuse-reports-history-report.md) 
  - This is the place for you to read **Player** bug reporting, and/or to let **Players** report each other for cheating.
  - > [!NOTE]
    > The **Name** column is never clickable on this **Report**, but the **Download CSV** column will still work if there is data present.
