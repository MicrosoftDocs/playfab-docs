---
title: Metadata statistics
author: braulioal
description: Learn more how to add contextual data to a statistic
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Add contextual data to statistics

In this tutorial, we're going to explain how to add contextual information whenever a statistic is updated. There are cases in which just 
saving the statistics is'nt enough. The game studio could add some details about how a player performed a specific action, 
or there could be a feature within the game that relates to the statistic.

We're going to continue with our competitive shooter game. In this example, the game has tremendous success but is 
facing a challenge. There are too many complaints about people "hacking" the game with external 
components that remove recoil on the weapons and improve the aim assist. So now we're tasked with tracking more information about all 
the components used and network information in our game.

## Creating a statistic

To show how to deal with this scenario, we're going to take the statistic definition from the 
[Doing More With Statistics](doing-more-statistics.md) page. From this definition, we're going 
to see how to add metadata to every row added to the statistic.

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

For this tutorial, the important element to take from this example is the structure of the statistic. As you can see, 
it has multiple columns that allow multiple values. But our focus is on how we can add contextual 
information to each of these rows.


### Adding metadata to each statistic

We want to know if the player has any unauthorized hardware that affects gameplay or any other malicious software that could
enhance the player's performance. The anti-cheat system is capable of getting all of this information. We only need to attach 
this information for the long shots stat.

To perform this action, we're going to use the UpdateStatistics API. Here we can check the SDK example:

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
                Scores = new List<string> { score.ToString()},
                Metadata = "Anticheat data"
            }
        }
    };

    PlayFabResult<UpdateStatisticsResponse> updateResult = await statsAPI.UpdateStatisticsAsync(updateStatRequest);
}
```

The main concept we can see here'ss the usage of the `Metadata` parameter within the `StatisticUpdate`, which refers
to contextual data that is going to be updated a part from the value itself. Here we can add whatever information that could be meaningful for a developer, 
in this case, the anti-cheat data.

With these examples, we're now equipped to track all relevant information from our top players, enabling game moderators 
to make better decisions on who to ban.

## Conclusions 

In this tutorial, we learned how to do the following operations: 
* Create a multi-column statistic.
* Add metadata to the statistic.

## See also
- [Doing More With Statistics](doing-more-statistics.md).
- [Create Basic Statistics](create-basic-statistics.md).
- [Seasonal Statistics](seasonal-statistics.md).
- [API Reference](api-reference.md).