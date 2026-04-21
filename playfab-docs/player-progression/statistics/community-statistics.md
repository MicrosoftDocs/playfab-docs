---
title: Community Statistics
author: ravarnamsft
description: Learn how to create community statistics
ms.author: ravarna
ms.date: 06/02/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Community statistics

Community statistics are a powerful tool to increase engagement and foster player investment in your game. By aggregating statistics at the game title level, developers can create shared goals and challenges that encourage collaboration among players. This approach transforms individual player actions into contributions toward community-wide objectives, driving sustained engagement as players work together to achieve collective milestones. Players feel their individual contributions matter to the larger community, strengthening their connection to both the game and fellow players.

For example, imagine implementing a global boss battle where the entire player base must collectively score 10 million eliminations within a week to unlock a special in-game event. As players see the community progress bar advancing with each of their contributions, they're motivated to help reach the goal. This behavior creates a powerful feedback loop of investment and participation, especially when paired with real-time progress updates and milestone rewards along the way.

With PlayFab, you can easily manage community statistics by defining two statistics: one at the player level (aggregation source) and another at the title or group level (aggregation destination). Updates made to player statistics automatically aggregate to the destination statistic. To retrieve the current community score, you read the statistics for the destination entity.

PlayFab supports two types of community statistics:

- **Title-level**: Aggregates all player updates into a single title-wide statistic. Ideal for global goals shared across the entire player base.
- **Group-level**: Aggregates player updates into a group entity statistic. Ideal for clan challenges, guild goals, or team-based objectives where subsets of players work toward a shared target.

## Title-level community statistics

### Creating the source statistic definition 

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

### Creating the destination statistic definition 

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
> **_NOTE:_** Set `EntityType` to `title` and `AggregationSources` to reference the statistic defined at the player level.

After you create the community statistic, any updates made at the player level start aggregating at the title level. The system aggregates only new updates. If the source statistic exists for a while, the system doesn't backfill those historical values at the title level.

### Reading title community statistics

To get the current scores for the statistic at the title level, read the statistics for the title entity:

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

## Group-level community statistics

Group-level community statistics let you aggregate player actions within a specific group, such as a clan or guild. This aggregation is useful for scenarios like a clan challenge where members collectively work toward a shared goal.

### Creating the destination statistic definition

Create a statistic definition with `EntityType` set to `group`. Specify the player statistic definition as the aggregation source:

```C#
// Use the PlayFabAuthenticationContext to call the API
PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
CreateStatisticDefinitionRequest statDefinitionRequest = new CreateStatisticDefinitionRequest()
{
    Name = "groupCommunityStat",
    AuthenticationContext = context,
    EntityType = "group",
    Columns = new List<StatisticColumn>()
    {
        new StatisticColumn()
        {
            Name = "Eliminations",
            AggregationMethod = StatisticAggregationMethod.Sum,
        },
    },
    AggregationSources = new string[] { "sourceStat" }
};

PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createStatDefResult = await statsAPI.CreateStatisticDefinitionAsync(statDefinitionRequest);
```

> [!NOTE]
> The source statistic definition (player-level) is the same as the one used for title-level community statistics. You can reuse an existing source statistic definition.

### Updating the source statistic

When updating a player's source statistic for group-level aggregation, specify the target group entity in the `AggregationTargetEntityKeys` property of the `StatisticUpdate` object. This property tells PlayFab which group entity to aggregate the update to.

```C#
// Use the PlayFabAuthenticationContext to call the API
PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);

UpdateStatisticsRequest request = new UpdateStatisticsRequest()
{
    AuthenticationContext = context,
    Entity = new PlayFab.LeaderboardsModels.EntityKey()
    {
        Id = "<player entity id>",
        Type = "title_player_account"
    },
    Statistics = new List<StatisticUpdate>()
    {
        new StatisticUpdate()
        {
            Name = "sourceStat",
            Scores = new List<string> { "5" },
            AggregationTargetEntityKeys = new List<PlayFab.LeaderboardsModels.EntityKey>()
            {
                new PlayFab.LeaderboardsModels.EntityKey()
                {
                    Id = "<group entity id>",
                    Type = "group"
                }
            }
        }
    }
};

PlayFabResult<UpdateStatisticsResponse> result = await statsAPI.UpdateStatisticsAsync(request);
```

> [!IMPORTANT]
> For title-level community statistics, `AggregationTargetEntityKeys` isn't required because the title is the default aggregation target. For group-level community statistics, you must specify the group entity key. Currently, you can specify only one entity key in `AggregationTargetEntityKeys`.

### Reading group community statistics

To get the current scores for the group community statistic, read the statistics for the group entity:

```C#
// Use the PlayFabAuthenticationContext to call the API
PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);

GetStatisticsRequest request = new GetStatisticsRequest()
{
    AuthenticationContext = context,
    Entity = new PlayFab.LeaderboardsModels.EntityKey()
    {
        Id = "<group entity id>",
        Type = "group"
    },
};

PlayFabResult<GetStatisticsResponse> result = await statsAPI.GetStatisticsAsync(request);
```

## Restrictions

* You can specify only one aggregation source for the community statistic.
* You can't specify version configuration for the community statistic. The version configuration you specify for the source statistic also applies to the community statistic.
* The `EntityType` for the community statistic must be `title` or `group`.
* You can't use `Last` aggregation for any of the columns.
* You can specify only one entity key in `AggregationTargetEntityKeys` when updating the source statistic.

## See also

- [Create basic statistics](create-basic-statistics.md)
- [Doing more with statistics](doing-more-statistics.md)
- [Seasonal statistics](seasonal-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md)
- [API reference](api-reference.md)
- [Limits](limits-statistics.md)
- [Quota](quota-statistics.md)
- [Statistics meters](../../pricing/Meters/statistics-meters.md)