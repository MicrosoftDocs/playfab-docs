---
title: Ranking players by statistics
author: braulioal
description: Learn how to create a leaderboard linked to stats.
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Ranking players by statistics

In this tutorial, we're going to learn how to use both Leaderboards and Statistics services together. The end result is that, when a statistic is updated on an entity, is automatically reflected on the corresponding leaderboard.
For more information about Azure PlayFab Statistics, see [Statistics Overview](../statistics/index.md).


Let's start with an example of a shooter game that uses both services. Here we're going to take advantage of the 
tutorial of [Create a Basic Statistic](../statistics/create-basic-statistics.md) and continue with assumption that we already
have statistics created for the game. Now, we want to track long shots every time a player hits one in a match. We're going to have 
a statistic that records the best long shot of a player and a leaderboard with the best players hitting longshots.


## Creating a leaderboard linked to a statistic

The first step is to create a leaderboard definition that can take as input the information tracked by the Statistics
service. The following example shows how to create the leaderboard definition using the C# SDK.

``` C#

public static async Task CreateStatLinkedLeaderboardDefinitionAsync(PlayFabAuthenticationContext context, string leaderboardName, string statName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    CreateLeaderboardDefinitionRequest leaderboardDefinitionRequest = new CreateLeaderboardDefinitionRequest()
    {
        AuthenticationContext = context,
        EntityType = EntityType,
        Name = leaderboardName,
        SizeLimit = 1000,
        VersionConfiguration = new VersionConfiguration()
        {
            MaxQueryableVersions = 1,
            ResetInterval = ResetInterval.Manual,
        },
        Columns = new List<LeaderboardColumn>()
        {
            new LeaderboardColumn()
            {
                Name = "Distance",
                SortDirection = LeaderboardSortDirection.Descending,
                LinkedStatisticColumn = new LinkedStatisticColumn()
                {
                    LinkedStatisticName = statName,
                    LinkedStatisticColumnName = "Distance",
                }
            },
            new LeaderboardColumn()
            {
                Name = "Caliber of the bullet",
                SortDirection = LeaderboardSortDirection.Ascending,
                LinkedStatisticColumn = new LinkedStatisticColumn()
                {
                    LinkedStatisticName = statName,
                    LinkedStatisticColumnName = "Caliber",
                }
            }
        }
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createLbDefinitionResult = await leaderboardsAPI.CreateLeaderboardDefinitionAsync(leaderboardDefinitionRequest);
}
```

Now, let's explain the main difference with the other leaderboard definitions that we created before. Note the `LeaderboardColumn` object, with a property called `LinkedStatisticColumn`, which allow us to create a link between
the stats and the leaderboard. We need to specify the statistic name and the column name within that statistic to make the mapping.

By doing this, we track the player's progress with the Statistics service. Then the Leaderboard service uses 
this information and populates the linked leaderboard.

## Unlink statistic from leaderboard

The service also has a mechanism to unlink the statistics from the leaderboard if needed. There could be multiple
reasons why a developer might want to perform this action, such as testing different configurations or mapping 
different statistics. The following example shows how to unlink the statistics from the leaderboard using the C# SDK.


``` C#
public static async Task UnlinkLeaderboard(PlayFabAuthenticationContext context, string statName, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);

    UnlinkLeaderboardFromStatisticRequest unlinkLbRequest = new UnlinkLeaderboardFromStatisticRequest()
    {
        AuthenticationContext = context,
        Name = leaderboardName,
        StatisticName = statName,
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> lbResponse = await leaderboardsAPI.UnlinkLeaderboardFromStatisticAsync(unlinkLbRequest);
}
```

With this information, we can link and unlink statistics from leaderboards whenever necessary. There are some important constraints to keep in mind:
- Leaderboards can't be updated directly, it should always go through the stat update to make use of the automatic mechanism.
- Leaderboards can't increment their version independently from the statistic.
- Leaderboards can't be deleted unless we go through the unlinking process.

## Conclusions

In this tutorial, we learned how to create a leaderboard powered by statistics and also how to unlink the services.
For more information about other features, see following pages:
- [Create basic leaderboard](create-basic-leaderboard.md).
- [Seasonal leaderboards](seasonal-leaderboards.md).
- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Add contextual data to leaderboards](metadata-leaderboards.md).
- [API reference](api-reference.md).

