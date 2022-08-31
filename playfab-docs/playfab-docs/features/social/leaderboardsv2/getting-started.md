---
title: Leaderboards v2 Tutorials
author: xmcai2016
description: Learn how to use specific private static void methods in Java to view and delete statistics in Leaderboards v2.
ms.author: joanlee
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
> Access to this feature is restricted to select titles that PlayFab actively reaches out to.


## Viewing Statistics 
You can call `GetLeaderboard` to pull the current data on your leaderboard:
```Java
 private static void getLeaderboard() {
        //call an existing leaderboard
        PlayFabLeaderboardsModels.GetEntityLeaderboardRequest getEntityLeaderboardRequest = new PlayFabLeaderboardsModels.GetEntityLeaderboardRequest();

        getEntityLeaderboardRequest.EntityType ="{{the type of the entity}}"; // Example: title_player_account
        getEntityLeaderboardRequest.MaxResults = Long.valueOf(10); // Want to see maximum the top 10 statistics ranked on the leaderboard
        getEntityLeaderboardRequest.StatisticName = "{{Name of your leaderboard";

        ArrayList<PlayFabLeaderboardsModels.EntityLeaderboardEntry> rankings
                = PlayFabLeaderboardsAPI.GetLeaderboard(getEntityLeaderboardRequest).Result.Rankings;

        //Do something about the result, such as:
        rankings.forEach(ranking -> System.out.println(ranking.Rank + " " + ranking.Score));
    }
```
You can also call `GetStatisticDefinition` to see how your leaderboard was configured:
```java 
    private static void getLeaderboardInfo() {
        PlayFabLeaderboardsModels.GetStatisticDefinitionRequest getStatisticDefinitionRequest = new PlayFabLeaderboardsModels.GetStatisticDefinitionRequest();
        getStatisticDefinitionRequest.Name = "{{the name of the leaderboard}}"; //fill in the name of your leaderboard
        PlayFabLeaderboardsModels.GetStatisticDefinitionResponse response
                = PlayFabLeaderboardsAPI.GetStatisticDefinition(getStatisticDefinitionRequest).Result;
        
        //Now you can do something with the response, or just simply printing them out for testing purposes:
        System.out.println("Name: "+ response.Name);
        System.out.println("AggregationMethod: "+ response.AggregationMethod);
        System.out.println("Created: "+ response.Created);
        System.out.println("LastResetTime: "+ response.LastResetTime);
        System.out.println("ChildLeaderboardNames: "+ response.LeaderboardDefinition.ChildLeaderboardNames);
    }
```
You can also see a list of all your leaderboard definitions by calling `GetStatisticDefinitions`:
```java
    private static void getAllDefs() {
        PlayFabLeaderboardsModels.GetStatisticDefinitionsRequest getStatisticDefinitionsRequest = new PlayFabLeaderboardsModels.GetStatisticDefinitionsRequest();
        ArrayList<PlayFabLeaderboardsModels.StatisticDefinition> results = PlayFabLeaderboardsAPI.GetStatisticDefinitions(getStatisticDefinitionsRequest).Result.StatisticDefinitions;
        results.forEach(result -> System.out.println(result.Name));
    }
```
`GetLeaderboardAroundEntity` lets you see entities ranked near a certain position on a leaderboard, namely, a snapshot of a part of the leaderboard.

```java
    private static void getLeaderboardAroundEntity() {
        PlayFabLeaderboardsModels.GetLeaderboardAroundEntityRequest req = new PlayFabLeaderboardsModels.GetLeaderboardAroundEntityRequest();

        // Define the entity to perform the call on
        req.Entity = new PlayFabLeaderboardsModels.EntityKey();
        req.Entity.Type = "title_player_account";
        req.Entity.Id = "7FEDE4301B2C0D78";

        req.StatisticName = "TaggedBasic"; // Name of the leaderboard
        req.Offset = Long.valueOf(1); // How many entries above and below the current position of the entity on the ranking

        ArrayList<PlayFabLeaderboardsModels.EntityLeaderboardEntry> rankings = PlayFabLeaderboardsAPI.GetLeaderboardAroundEntity(req).Result.Rankings;

        // Do something about the response, such as:
        rankings.forEach(ranking -> System.out.println(ranking.Rank + " " + ranking.Score));
    }
```

Finally, it's useful sometimes to immediately see the ranks of select players on a leaderboard to gauge their relative performance. The `GetLeaderboardForEntities` call accomplishes just that:

```java
private static void getLeaderboardForEntities() {
        PlayFabLeaderboardsModels.GetLeaderboardForEntitiesRequest getLeaderboardForEntitiesRequest = new PlayFabLeaderboardsModels.GetLeaderboardForEntitiesRequest();
        getLeaderboardForEntitiesRequest.Entities = new ArrayList<>();
        getLeaderboardForEntitiesRequest.StatisticName = "{{name of the leaderboard}}";
        getLeaderboardForEntitiesRequest.EntityType = "{{example: title_player_account}}";
        getLeaderboardForEntitiesRequest.Entities.add("{{Id of the first entity}}"); //example: F8A6093F4730C1B4
        getLeaderboardForEntitiesRequest.Entities.add("{{Id of the second entity}}"); //repeat this line for more entities if needed

        ArrayList<PlayFabLeaderboardsModels.EntityLeaderboardEntry> rankings
                = PlayFabLeaderboardsAPI.GetLeaderboardForEntities(getLeaderboardForEntitiesRequest).Result.Rankings;
        //do something about the result rankings, for example:
        rankings.forEach(ranking -> System.out.println(ranking.Rank + " " + ranking.Score));

    }
```

## Deleting Statistics

Deleting statistics is a new feature in v2. You can delete an entire leaderboard as follows: 
```Java
private static void deleteLeaderboard() {
        PlayFabLeaderboardsModels.DeleteStatisticDefinitionRequest deleteStatisticDefinitionRequest = new PlayFabLeaderboardsModels.DeleteStatisticDefinitionRequest();
    
        deleteStatisticDefinitionRequest.Name = "{{the name of the leaderboard to delete}}";
        PlayFabLeaderboardsAPI.DeleteStatisticDefinition(deleteStatisticDefinitionRequest);
    }
```


Alternatively, you could delete a bunch of individual statistics for a single entity at once:

```Java
 private static void deleteStatistics() {
        PlayFabLeaderboardsModels.DeleteStatisticsRequest deleteStatisticsRequest = new PlayFabLeaderboardsModels.DeleteStatisticsRequest();

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

## Leaderboard Versions
Say your game has a weekly tournament that produces new rankings of players, it is important to keep track of the `Version` your leaderboard as it updates weekly. You can call `IncrementStatisticVersion` to increment the version number (starts with 0) of your leaderboard. 
```java
    private static void incrementVersion() {
        PlayFabLeaderboardsModels.IncrementStatisticVersionRequest incrementStatisticVersionRequest = new PlayFabLeaderboardsModels.IncrementStatisticVersionRequest();
        incrementStatisticVersionRequest.Name = "{{name of leaderboard}}";
        PlayFabResult<PlayFabLeaderboardsModels.IncrementStatisticVersionResponse> response =
                PlayFabLeaderboardsAPI.IncrementStatisticVersion(incrementStatisticVersionRequest);
        
        // If needed, you can get the current version number from the response
        System.out.println("Version: " +response.Result.Version);
        System.out.println("Deleted Version: " +response.Result.VersionToBeDeleted);
    }
```
Keep in mind that you can't increment the version too frequently (less than 5 minutes) because it defeats the purpose of having a leaderboard that everyone can see and engage with. 