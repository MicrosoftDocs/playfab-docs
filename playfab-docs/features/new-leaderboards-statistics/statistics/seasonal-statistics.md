---
title: Seasonal statistics
author: braulioal
description: Learn more about versioning on statistics
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Seasonal statistics

In this tutorial, we explain the concept of versioning for statistics. There are multiple cases where we want to have 
different versions of a given statistic. For example if a game has seasons, it's most likely going to reset the stats when
the new season begins.

We continue with the example from the [Create Basic Statistic](create-basic-statistics.md). Imagine that our shooter game is getting really popular. Therefore, the concept of seasons is introduced. Every month, the game releases a new theme season for all the
player base. So we want to keep independent stats per season.

## Creating a statistic definition for versioning 

In the previous example, when creating a statistic definition, there was a hint about the importance of the `VersionConfiguration` 
parameter for versioning. Here, we detail how to use it and how it works.

``` C#
public static async Task CreateStatisticDefinitionAsync(PlayFabAuthenticationContext context, string statName)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    CreateStatisticDefinitionRequest statDefinitionRequest = new CreateStatisticDefinitionRequest()
    {
        Name = statName,
        AuthenticationContext = context,
        EntityType = "title_player_account",
        VersionConfiguration = new VersionConfiguration()
        {
            MaxQueryableVersions = 12,
            ResetInterval = ResetInterval.Month,
        },
        Columns = new List<StatisticColumn>()
        {
            new StatisticColumn()
            {
                Name = "Longshots",
                AggregationMethod = StatisticAggregationMethod.Max,
            }
        },
    };
    
    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createStatDefResult = await statsAPI.CreateStatisticDefinitionAsync(statDefinitionRequest);
}
```

The main difference in this example compared to the basic statistic is the `VersionConfiguration` parameter. This parameter allows us to define a 
`MaxQueryableVersions` setting, which specifies how many versions of the same statistic we can query. In this case, we set it to query 12 versions. 
The `ResetInterval` parameter defines how often the reset process occurs. This process involves creating a statistic with the same configuration as 
before but without any value, and the version parameter changes as follows: N = N + 1, with N = 0 at the creation of the statistic definition.

For example, let's we have a statistic with the version parameter equals to two with a given value. Now
we increase the version of that statistic, then the result is going to be a new statistic with the version parameter equals to three without any values.
Meanwhile the previous statistic remains in the system to be query.

The `ResetInterval` can work in multiple ways. In this example, it's monthly, but it can be changed according to the developer's needs. In this particular
case, it means that the leaderboard is going to be reset automatically every month from the moment it was configured. We support the following reset strategies:
- Day
- Hour
- Manual
- Month
- Week


[API Reference Creating a Statistic](/rest/api/playfab/progression/statistics/create-statistic-definition)

## Incrementing the version of a statistic

With this new configuration, we can have multiple versions of the same statistic for different seasons. 
But what happens if we need to manually reset the leaderboard due to an issue and start over the season? 
In such cases, we can perform a manual reset using the API. Here's an example using the SDK:

``` C#
public static async Task ResetStatistic(PlayFabAuthenticationContext context, string statName)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    IncrementStatisticVersionRequest resetStatRequest = new IncrementStatisticVersionRequest()
    {
        AuthenticationContext = context,
        Name = statName,
    };

    PlayFabResult<PlayFab.LeaderboardsModels.IncrementStatisticVersionResponse> resetStatResponse = await statsAPI.IncrementStatisticVersionAsync(resetStatRequest);
}
```

Now we're set to handle any challenges with versioning on statistics. One important aspect here's that the number of statistics definitions 
that we decide to keep as versions are going to be meter as they use storage within the service. See more about this here:
- [Statistics](../../pricing/meters/statistics-meters.md).

## Conclusions

In this tutorial, we learned how to do the following operations: 
* Create a statistic with the right reset strategy
* Increment the version of a statistic

## See also
- [Doing More With Statistics](doing-more-statistics.md).
- [Create Basic Statistics](create-basic-statistics.md).
- [Add Contextual Data to Statistics](metadata-statistics.md).
- [API Reference](api-reference.md).
