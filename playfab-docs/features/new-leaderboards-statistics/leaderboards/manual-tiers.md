---
title: Manual Tier Leaderboards
author: braulioal
description: Learn how to create your own tiering system with leaderboards
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Manual tiers using leaderboards

In this tutorial, we're going to learn how to apply some properties within the leaderboards
service  to create a tier system for players. For understanding how to create a manual tier system
based on the service properties, we're going to start with an example. Imagine we have a zombie-killing game,
 where players have a limited amount of time to score as many points as possible. Different strategies can be employed to gain more points,
 and there are also points for not receiving any damage.

In this example, players earn experience points based on their performance in each match. We want to create a tier system to identify the top player
with the rank of "Saviors," while the rest of the players are going to be distributed across different ranks like Bronze, Silver, Gold, Platinum, and Diamond.

## Create a Leaderboard

The first step is to create a leaderboard definition that includes the main elements for ranking players. For our zombie game,
we're going to use multiple scores. The following example shows how to create the leaderboard definition using the C# SDK.

``` C#
public static async Task CreateLeaderboardDefinitionAsync(PlayFabAuthenticationContext context, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    CreateLeaderboardDefinitionRequest leaderboardDefinitionRequest = new CreateLeaderboardDefinitionRequest()
    {
        AuthenticationContext = context,
        Name = leaderboardName,
        SizeLimit = 10000,
        EntityType = "title_player_account",
        VersionConfiguration = new VersionConfiguration()
        {
            MaxQueryableVersions = 1,
            ResetInterval = ResetInterval.Manual,
        },
        Columns = new List<LeaderboardColumn>()
        {
            new LeaderboardColumn()
            {
                Name = "Eliminations",
                SortDirection = LeaderboardSortDirection.Descending,
            },
            new LeaderboardColumn()
            {
                Name = "SkillPoints",
                SortDirection = LeaderboardSortDirection.Descending,
            }
            new LeaderboardColumn()
            {
                Name = "Deaths",
                SortDirection = LeaderboardSortDirection.Ascending,
            }         
        }
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createLbDefinitionResult = await leaderboardsAPI.CreateLeaderboardDefinitionAsync(leaderboardDefinitionRequest);
}
```

Here we have our leaderboard defined with three different scores. For more information on creating leaderboards or how tie-breaking works,
check the following guide: [Doing more with leaderboards](doing-more-with-leaderboards.md).

## Manual tiering

With the leaderboard properly created, we can now proceed to define how we want to create our tiers. First,
we need to define how we want to split the players population. Typically, as higher the rank
the fewer the players. With that concept in mind here's how we're going to define our tiers.

- Bronze: 0 - 35% of the players.
- Silver: 35% - 60% of players.
- Gold:  60% - 80% of players.
- Platinum:  80% - 90% of players.
- Diamond:  90% - 99.5% of players.
- Saviors: Top 0.05% of players.

Since this process is a manual approach to a tier system, the distribution of the players
needs to be stored in any way the developer see fit. 

In order to retrieve data, we're going to use the following example:

``` C#
public static async Task<List<EntityLeaderboardEntry>> GetLeaderboard(PlayFabAuthenticationContext context, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    GetEntityLeaderboardRequest getLbRequest = new GetEntityLeaderboardRequest()
    {
        LeaderboardName = leaderboardName,
        StartingPosition = 1,
        PageSize = 20,
        AuthenticationContext = context,
    };

    PlayFabResult<GetEntityLeaderboardResponse> lbResponse = await leaderboardsAPI.GetLeaderboardAsync(getLbRequest);
    
    return lbResponse.Result;
}
```

This example is one of our multiple ways of retrieving data from the leaderboard. In the Result property of the response,
we're going to find a property called `EntryCount` that tell us how many rows the leaderboard currently has.
This number is different from `SizeLimit` which represents the maximum number of rows of the leaderboard.

To determine a player's tier, we take their position within the leaderboard and divide it by the `EntryCount` 
property to see where they fit within the defined tiers.

Quick examples:
- Bottom Player: A player positioned at 8500 out of 10,000 is within the 85% of the population, falling into the Bronze tier.
- Middle Player: A player positioned at 3500 out of 10,000 is within the top 35% of players, falling into the Gold tier.
- Top Player: A player positioned at 50 out of 10,000 is within the top 0.5% of players, becoming a "Savior."

## Conclusions 
In this tutorial, we learned how to do the following operations: 
* Create a leaderboard.
* Learn how to query data from a leaderboard.
* Learn how to create a manual tier distribution based on percentiles.
* Learn how to map the result of the position of a player to an actual tier.


## See also
- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Create basic leaderboard](create-basic-leaderboard.md)
- [Group leaderboards](group-leaderboards.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md)
- [Add contextual data to leaderboards](metadata-leaderboards.md)
- [API reference](api-reference.md)