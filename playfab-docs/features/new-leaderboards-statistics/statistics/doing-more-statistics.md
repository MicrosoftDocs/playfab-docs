---
title: Doing more with statistics
author: braulioal
description: Learn how about the advanced features of statistics
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Doing more with statistics

In this tutorial, we're going to cover more advanced features that the service has to offer, such as creating multi-column
statistics and multiple ways to query for statistics. With these features, we aim to push
the limits of what a statistics service should be capable of doing.

We're using a highly competitive shooter as an example of how these new features could help us solve
some problems. In this game, there are multiple weapons that allow the player to hit a long shot. We want to track not
only the distance of the long shot but the caliber of the bullet that was used.

## Prerequisite

Complete the steps in [Create a basic statistic](create-basic-statistics.md).

## Creating a multi-column statistic definition

To begin with this example, we need to create a more complex statistic definition than the one we had before.

We're going to define multiple columns to map the key aspects of the long shot: distances and caliber.
The following example shows how to create the statistic definition using the C# SDK.

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
            MaxQueryableVersions = 1,
            ResetInterval = ResetInterval.Manual,
        },
        Columns = new List<StatisticColumn>()
        {
            new StatisticColumn()
            {
                Name = "Distance",
                AggregationMethod = StatisticAggregationMethod.Max,
            },
             new StatisticColumn()
            {
                Name = "Caliber",
                AggregationMethod = StatisticAggregationMethod.Min,
            }
        },
    };
    
    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createStatDefResult = await statsAPI.CreateStatisticDefinitionAsync(statDefinitionRequest);
}
```

The most important component here's the `Columns` parameter, which allows multiple definitions of `StatisticColumn` so 
that statistic could have multiple values. The only exception is when we use the aggregation of `Sum`.

## Adding data to a statistic

Now that we have our statistic created, we're going to add data. The main difference from our previous tutorial on this subject is 
that now we need to add two different values. The following example shows how to add data to our statistic 
using the C# SDK.

``` C#
public static async Task UpdateStatisticForPlayer(PlayFabAuthenticationContext context, string statName, string entityId, int score)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);
    UpdateStatisticsRequest updateStatRequest = new UpdateStatisticsRequest()
    {
        Entity = new PlayFab.LeaderboardsModels.EntityKey()
        {
            Id = entityId,
            Type = EntityType
        },
        AuthenticationContext = context,
        Statistics = new List<PlayFab.LeaderboardsModels.StatisticUpdate>() 
        {
            new PlayFab.LeaderboardsModels.StatisticUpdate() 
            {
                Name = statName,
                Scores = new List<string> { score.ToString(), score.ToString()},
            }
        }
    };

    PlayFabResult<UpdateStatisticsResponse> updateResult = await statsAPI.UpdateStatisticsAsync(updateStatRequest);
}
```

Here the main point relies on the `Scores` parameter within the statistic that is going to be added. In the code example, 
we see two different values, which are all them strings, but it's just an input definition within the statistic. These values
are handled as numbers. The length of the list of scores should always match with the number of columns of the statistic
definition.

## Retrieving data from a statistic

Now we're going to learn a way to query multiple entities and get all of the statistics related to each of them.
The following example shows how to add data to our statistic 
using the C# SDK.

``` C#
public static async Task GetStatsForEntities(PlayFabAuthenticationContext context, string[] entityIds)
{
    PlayFabProgressionInstanceAPI statsAPI = new PlayFabProgressionInstanceAPI(context);

    GetStatisticsForEntitiesRequest request = new GetStatisticsForEntitiesRequest()
    {
        AuthenticationContext = context,
        Entities = entityIds.Select(entity => new PlayFab.LeaderboardsModels.EntityKey()
        {
            Id = entity,
            Type = EntityType
        }).ToList(),
    };

    PlayFabResult<GetStatisticsForEntitiesResponse> result = await statsAPI.GetStatisticsForEntitiesAsync(request);

    foreach (EntityStatistics entityStatistics in result.Result.EntitiesStatistics)
    {
        Console.WriteLine("Stats for entity: " + entityStatistics.EntityKey.ToString());
        foreach (var stat in entityStatistics.Statistics)
        {
            Console.WriteLine($"{stat.Name} : {string.Join('|', stat.Scores)}");
        }
    }

}
```

### Tie-breaking

When we have a multi-column statistic definition, we could come across a scenario that needs tie-breaking. The way
this mechanism works is that follows the way in which columns were added. Whenever a new value comes in, the system checks
if it meets the criteria of the aggregation for the first column. In case the value is the same, then it goes and checks
the criteria for the second colum. This behavior continues for the following columns.

For example, we can have a statistic we three columns: 
   - First column has Min Aggregation.
   - Second column has Max Aggregation.
   - Third column has Last Aggregation.

If a new value comes in, it needs to be lower than the first column. Then it needs to be greater to the second column.
Finally the third column is set to Last Aggregation, so if it meets the first two validations, then is always updated.

## Conclusion 

In this tutorial, we learned how to do the following operations: 
* Create a multi-column statistic
* Query for statistics
* Understand how tie-breaking works.

## See also

- [Add contextual data to statistics](metadata-statistics.md)..
- [Create basic statistics](create-basic-statistics.md).
- [Seasonal statistics](seasonal-statistics.md).
- [API reference](api-reference.md).
