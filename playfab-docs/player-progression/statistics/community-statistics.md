---
title: Community Statistics
author: ravarna
description: Learn how to create community statistics
ms.author: ravarna
ms.date: 06/02/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Community statistics

Community statistics are a powerful tool to increase engagement and foster player investment in your game. By aggregating statistics at the game title level, developers can create shared goals and challenges that encourage collaboration among players. It transforms individual player actions into contributions toward community-wide objectives, driving sustained engagement as players work together to achieve collective milestones. Players feel their individual contributions matter to the larger community, strengthening their connection to both the game and fellow players.

For example, imagine implementing a global boss battle where the entire player base must collectively score 10 million eliminations within a week to unlock a special in-game event. As players see the community progress bar advancing with each of their contributions, they're motivated to help reach the goal. This creates a powerful feedback loop of investment and participation, especially when paired with real-time progress updates and milestone rewards along the way.

With PlayFab, you can easily manage community statistics by defining two statistics: one at the player level (aggregation source) and another at the game title level (aggregation destination). Updates made to player statistics are automatically aggregated to the title-level statistic. To retrieve the current community score, you read the statistics for the title entity.

## Creating the source statistic definition 

First, create a statistic definition for players, which acts as the aggregation source:

```C#
// Use the PlayFabAuthenticationContext to call the API
PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
CreateStatisticDefinitionRequest statDefinitionRequest = new CreateStatisticDefinitionRequest()
{
    Name = "sourceStat",
    AuthenticationContext = context,
    EntityType = "title_player_account",
    VersionConfiguration = new VersionConfiguration()
    {
        MaxQueryableVersions = 1,
        ResetInterval = ResetInterval.Manual,
    },
    Columns = new List<StatisticColumn>()
    {
        new StatisticColumn()
        {
            Name = "Eliminations",
            AggregationMethod = StatisticAggregationMethod.Sum,
        },
    },
};

PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createStatDefResult = await statsAPI.CreateStatisticDefinitionAsync(statDefinitionRequest);
```

## Creating the destination statistic definition 

Next, create a statistic definition for the title, which acts as the aggregation destination. Specify the player statistic definition as the aggregation source for the title statistic definition:

```C#
// Use the PlayFabAuthenticationContext to call the API
PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
CreateStatisticDefinitionRequest statDefinitionRequest = new CreateStatisticDefinitionRequest()
{
    Name = "communityStat",
    AuthenticationContext = context,
    EntityType = "title",
    Columns = new List<StatisticColumn>()
    {
        new StatisticColumn()
        {
            Name = "Eliminations",
            AggregationMethod = StatisticAggregationMethod.Sum,
        },
    },
    AggregationSources = new string[] { "sourceStat" };
};

PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createStatDefResult = await statsAPI.CreateStatisticDefinitionAsync(statDefinitionRequest);
```
> **_NOTE:_** `EntityType` is set to `title` and `AggregationSources` is set to reference the statistic defined at the player level.

Once the community statistic is created, any updates made at the player level start getting aggregated at the title level. Only *new* updates are aggregated. If the source statistic has existed for a while, those historical values aren't backfilled at the title level.

## Reading Community Statistics

To retrieve the current scores for the statistic at the title level, read the statistics for the Title entity:

```C#
// Use the PlayFabAuthenticationContext to call the API
PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);

GetStatisticsRequest request = new GetStatisticsRequest()
{
    AuthenticationContext = context,
    Entity = new PlayFab.LeaderboardsModels.EntityKey()
    {
        Id = "<title id in hex>",
        Type = "title"
    },
};

PlayFabResult<GetStatisticsResponse> result = await statsAPI.GetStatisticsAsync(request); 
```

## Restrictions

* Currently, only one aggregation source can be specified for the community statistic.
* Version configuration can't be specified for the community statistic. The version configuration specified for the source statistic applies to the community statistic as well.
* The `EntityType` for the community statistic *must* be `title`.
* `Last` aggregation can't be used for the first column.

## See also

- [Create basic statistics](create-basic-statistics.md)
- [Doing more with statistics](doing-more-statistics.md)
- [Seasonal statistics](seasonal-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md)
- [API reference](api-reference.md)
- [Limits](limits-statistics.md)
- [Quota](quota-statistics.md)
- [Statistics meters](../../pricing/Meters/statistics-meters.md)