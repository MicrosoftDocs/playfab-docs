---
title: Daily and Monthly CDN Usage Report
author: v-thopra
description: Describes the report that tracks Content Delivery Network (CDN) usage by your players.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Daily and Monthly CDN Usage Report

## Daily Content Usage Report

The **CDN Usage Report** contains two graphs displaying content usage over a 24 hour period:

- The **Data Volume (1)** graph illustrates the distribution of transferred bytes.
- The **Access Count (2)** graph shows the distribution of content downloads over a specified period of time.

![Daily Content Usage Report Table](media/tutorials/daily-content-usage-report-table.png)  

## Monthly Content Usage Summary Report

This **Report** summarizes **Monthly Content Usage**. The table contains the amount of content bytes transferred, as well as the total number of downloads during a specified month.

![Monthly Content Usage Report Table](media/tutorials/monthly-content-usage-report-table.png)  

## Populating content usage Reports

The code in the template shown below may be used to introduce some data for the **Reports**.

```csharp
public void GetContent()
{
    PlayFabClientAPI.GetContentDownloadUrl(new GetContentDownloadUrlRequest() {
        HttpMethod = "GET",
        Key = "ContentKey"
    }, result => {
        // Implement your own Download function based on URL
        DownloadContent(result.URL);
    }, error => {
        Debug.LogError(error.GenerateErrorReport());        
    });
}
```

It is important to understand that the [GetContentDownloadUrl](xref:titleid.playfabapi.com.client.content.getcontentdownloadurl) **API** call, on it's own, does not produce a new entry in the **Report**.

Instead, it provides you with a **URI** for the content download. You may use any **HTTP** request technique to execute a **GET** request. Once this is done, a new entry will be added and reflected in both **Reports**.

## How to work with Report Charts

**PlayFab Report Charts** all follow the same model:

- In the top space of the page, you usually get a **Control Panel (1)**. This contains a **Report Name**, observed time period, and **Prev/Next** buttons to switch between the time periods.

- The **Chart Panel (2)** shows the available data as a **Chart**, where the horizontal axis corresponds to the time flow, and the vertical axis corresponds to the number of relevant instances - such as **API** calls, **Purchases**, **Users**, and so on, depending on the **Report Type**.

![Monthly Overview Report](media/tutorials/monthly-overview-report.png)  

- The metrics available in the **Timeline** area **(3)** contain the sum of all the instance across the time period (**SUM**), the average number of instances through all the timestamps (**AVG**), the peak value (**MAX**), and the lowest value (**MIN**).
