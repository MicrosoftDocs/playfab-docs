---
title: Transaction writes
author: braulioal
description: Learn how to create transactional writes for statistics
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Transactional writes

In this tutorial, we're going to explain  how to perform a transactional write to a statistic. Depending on the
process used to store statistics, developers might encounter scenarios that could result in the duplication of
an operation, in particular with the SUM aggregation. To address these complex scenarios, we added the transactional write feature.

We're going to start with an example involving a multiplayer game with many matches being played simultaneously.
This game stores a large number of statistics and other telemetry values for each match. To avoid disrupting
the player experience, the studio decided to push the stats every 10 minutes instead of real-time.

This approach ensures a seamless experience for players jumping from one match to another. However, it 
introduces new technical challenges. We now need a queue to execute requests every 10 minutes. But what
happens if we want to replay the events in the queue for any given reason. Then we need might have a challenge,
specially if we have statistics with SUM aggregation, since we need to avoid double counting.

With this context in mind, we're going to show how to solve this particular problem.

## Creating a statistic definition 

We're going to start by creating a statistic definition, at this level we don't need to add any special
configuration for the transactional writes.


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
                Name = "Eliminations",
                AggregationMethod = StatisticAggregationMethod.Sum,
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

## Adding data to a statistic

Continuing with our example, we are going to add data  to the previously defined Statistic. The key difference
between a normal request and this one is the special `TransactionId` parameter. This parameter serves as an
identifier for the request being executed. Each time a new request arrives, the system compares the new
transaction IDs with those identifiers that were already processed. If a match is found, the request is not going to be executed.

One key aspect to consider is that this transactional behavior establishes a relationship between the 
`TransactionId` and the request being executed, not with the individual statistics within that request. 
There isn't a mapping for each individual stat; the mapping is for the entire request. Also, when this feature
is being used we have a different meter for tracking this type of requests, learn more here: [Statistics meters](../../pricing/Meters/statistics-meters.md)

``` C#
public static async Task UpdateStatisticForPlayer(PlayFabAuthenticationContext context, string statName, string entityId, int eliminationScore, int caliberScore)
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
        TransactionId = "YOUR_OWN_IDENTIFIER"
        Statistics = new List<PlayFab.LeaderboardsModels.StatisticUpdate>() 
        {
            new PlayFab.LeaderboardsModels.StatisticUpdate() 
            {
                Name = statName,
                Scores = new List<string> { eliminationScore.ToString(), caliberScore.ToString()},
            }
        }
    };

    PlayFabResult<UpdateStatisticsResponse> updateResult = await statsAPI.UpdateStatisticsAsync(updateStatRequest);
}
```

Now, let's explain some key elements of this example:
- `Entity`: This parameter corresponds to the entity from which we want to make the update of the stat.
- `TransactionId`: This parameter corresponds to a string that represents a unique identifier for the request.
- `Statistics`: This parameter corresponds to the actual set of statistics of an entity. 
- `StatisticUpdate`: This parameter corresponds to the statistics values that are going to be added.
    -  `Scores`: This parameter corresponds to the list of scores you can add to one entity. Remember, statistics can have more than one column. 
     You can check these concepts in depth here: [Doing More With Statistics](doing-more-statistics.md)
    - `Name`: This parameter corresponds to the statistic name set when you created the statistic definition.

With these concepts clear, you're now ready to add data to your statistic and avoid any duplication on your requests.


## See also

- [Create basic statistics](create-basic-statistics.md).
- [Doing more with statistics](doing-more-statistics.md).
- [Seasonal statistics](seasonal-statistics.md).
- [Add contextual data to statistics](metadata-statistics.md).
- [API reference](api-reference.md).
- [Limits](limits-statistics.md).
- [Quota](quota-statistics.md)
- [Statistics meters](../../pricing/Meters/statistics-meters.md).
