---
title: Daily Abuse Reports History Report
author: joannaleecy
description: Describes the report that allows you to read player bug reporting, and/or to let players report each other for cheating.
ms.author: joanlee
ms.date: 10/30/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Daily Abuse Reports History Report

The Daily Abuse Reports history report contains a CSV document with all of the player reports that happened during the specified day.

In the example shown below, a player with ID of  **6079A16A9E4FB67** is reporting a player with ID of **94A248B3B9E628F2** for the reason **Test Report** on 5/14/2017.

![Daily Abuse Reports History Report Table](media/tutorials/daily-abuse-reports-history-report-table.png)  

> [!NOTE]
> For GDPR compliance reasons, the Daily Abuse History Reports are only available for the past 30 days. To learn more, visit our [GDPR documentation](../../privacy-compliance/playfab-gdpr-deleting-and-exporting-player-data.md).

Using this information, you can then use the reportee ID, to quickly look up the reported player and investigate.

![Game Manager - Players - Player ID Search](media/tutorials/game-manager-players-player-id-search.png)

## Populating the report

The following API call will produce new entries for this report.

```csharp
public void ReportPlayer() {
    PlayFabClientAPI.ReportPlayer( new ReportPlayerClientRequest() {
        ReporteeId = "94A248B3B9E628F2",
        Comment = "I think this person is cheating! Please, check!"
    }, result => {
        // Success
    }, error => Debug.LogError(error.GenerateErrorReport()));
}
```
