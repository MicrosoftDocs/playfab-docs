---
title: Daily Abuse Reports History Report
author: v-thopra
description: Describes the report that allows you to read player bug reporting, and/or to let players report each other for cheating.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, reports
ms.localizationpriority: medium
---

# Daily Abuse Reports History Report

## Overview

The Daily Abuse Reports History Report contains a CSV document with all player reports that happened during the specified day:

![Daily Abuse Reports History Report Table](media/tutorials/daily-abuse-reports-history-report-table.png)  

In the preceding example, a player with ID "6079A16A9E4FB67" is reporting a player with ID "94A248B3B9E628F2" for reason "Test Report" on 5/14/2017. Using this information, you can then use the Reportee ID to quickly look up the reported player and investigate:

![Game Manager - Players - Player ID Search](media/tutorials/game-manager-players-player-id-search.png)

## Populating the report

The following API call will produce new entries for this report:

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
