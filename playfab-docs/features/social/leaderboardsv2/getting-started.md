---
title: Leaderboards v2 tutorials
author: xmcai2016
description: Tutorials for Leaderboards v2.
ms.author: xmcai2016
ms.date: 10/18/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, social, leaderboards
ms.localizationpriority: medium
---

# Getting Started Tutorial

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> This documentation is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

## Deleting Statistics

Deleting statistics is a new feature in v2. You can delete an entire leaderboard as follows: 
```Java
private static void deleteLeaderboard() {
        PlayFabLeaderboardsModels.DeleteStatisticDefinitionRequest deleteStatisticDefinitionRequest
                = new PlayFabLeaderboardsModels.DeleteStatisticDefinitionRequest();
    
        deleteStatisticDefinitionRequest.Name = "{{the name of the leaderboard to delete}}";
        PlayFabLeaderboardsAPI.DeleteStatisticDefinition(deleteStatisticDefinitionRequest);
    }
```


Alternatively, you could delete a bunch of individual statistics for a single entity at once:

```Java
 private static void deleteStatistics() {
        PlayFabLeaderboardsModels.DeleteStatisticsRequest deleteStatisticsRequest
                = new PlayFabLeaderboardsModels.DeleteStatisticsRequest();

        ArrayList<PlayFabLeaderboardsModels.StatisticDelete> stats = new ArrayList<>();

        // Define the first statistic you want to delete
        // Repeat the next 3 lines of code for every statistic you want to delete
        PlayFabLeaderboardsModels.StatisticDelete stat0 = new PlayFabLeaderboardsModels.StatisticDelete();
        stat0.Name = "{{the name of a statistic you want to delete}}";
        stats.add(stat0);

        // Identify the entity you want to delete the statistics on
        deleteStatisticsRequest.Entity = new PlayFabLeaderboardsModels.EntityKey();
        deleteStatisticsRequest.Entity.Type = "{{the type of the entity}}"; // Example: title_player_account
        deleteStatisticsRequest.Entity.Id = "{{the id of the entity}}"; //Example: D0B9D3D19E9A5557
        deleteStatisticsRequest.Statistics = stats;
        PlayFabResult<PlayFabLeaderboardsModels.DeleteStatisticsResponse> response = PlayFabLeaderboardsAPI.DeleteStatistics(deleteStatisticsRequest);

        //Optional: do something about the response
    }
```

## Getting Statistics 
You can call `GetLeaderboard` to pull the current data on your leaderboard as follows:
```Java
 private static void getLeaderboard() {
        //call an existing leaderboard
        PlayFabLeaderboardsModels.GetEntityLeaderboardRequest getEntityLeaderboardRequest
                = new PlayFabLeaderboardsModels.GetEntityLeaderboardRequest();

        getEntityLeaderboardRequest.EntityType ="{{the type of the entity}}"; // Example: title_player_account
        getEntityLeaderboardRequest.MaxResults = Long.valueOf(10); // Want to see maximum the top 10 statistics ranked on the leaderboard
        getEntityLeaderboardRequest.StatisticName = "{{Name of your leaderboard";

        ArrayList<PlayFabLeaderboardsModels.EntityLeaderboardEntry> rankings
                = PlayFabLeaderboardsAPI.GetLeaderboard(getEntityLeaderboardRequest).Result.Rankings;

        //Do something about the result, such as:
        rankings.forEach(ranking -> System.out.println(ranking.Rank + " " + ranking.Score));
    }
```
