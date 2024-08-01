---
title: Daily and Monthly CDN Usage Report
author: joannaleecy
description: Describes the report that tracks Content Delivery Network (CDN) usage by your players.
ms.author: joanlee
ms.date: 10/30/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Daily and Monthly CDN Usage report

## Daily Content Usage report

The CDN Usage report contains two graphs displaying content usage over a 24 hour period:

1. The **Data Volume** graph illustrates the distribution of transferred bytes.
2. The **Access Count** graph shows the distribution of content downloads over a specified period of time.

![Daily Content Usage Report Table](media/tutorials/daily-content-usage-report-table.png)  

## Monthly Content Usage Summary report

This report summarizes monthly content usage. The table within it contains the amount of content bytes transferred, as well as the total number of downloads during a specified month.

![Monthly Content Usage Report Table](media/tutorials/monthly-content-usage-report-table.png)  

## Populating Content Usage reports

The code in the template shown below may be used to introduce some data for the reports.

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

It is important to understand that the [GetContentDownloadUrl](xref:titleid.playfabapi.com.client.content.getcontentdownloadurl) API call, on its own, does not produce a new entry in the report.

Instead, it provides you with a URI for the content download. You may use any HTTP request technique to execute a GET request. Once this is done, a new entry will be added and reflected in both reports.

## How to work with report charts

PlayFab report charts all follow the same model:

1. In the top area of the page, you usually get a **Control Panel**. This contains a report name, observed time period, and **Prev/Next** buttons to switch between the time periods.

2. The **Chart Panel** area shows the available data as a chart, where the horizontal axis corresponds to the time flow, and the vertical axis corresponds to the number of relevant instances - such as API calls, purchases, users, and so on, depending on the report type.

![Monthly Overview Report](media/tutorials/monthly-overview-report.png)  

3. The metrics available in the **Timeline** area contain the sum of all the instance across the time period (**SUM**), the average number of instances through all the timestamps (**AVG**), the peak value (**MAX**), and the lowest value (**MIN**).
