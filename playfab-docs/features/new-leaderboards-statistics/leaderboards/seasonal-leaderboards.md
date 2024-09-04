---
title: Seasonal leaderboards
author: braulioal
description: Learn more about versioning on leaderboards
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Seasonal leaderboards

In this tutorial, we explain the concept of versioning for leaderboards. There are multiple cases where we want to have 
different versions of a given leaderboard. For example, in a game with a monthly tournament mode, the structure of the leaderboard 
remains the same, but the players most likely change, especially in a highly competitive game.

We continue with the example from the [Create Basic Leaderboards](create-basic-leaderboard.md). Imagine that our arcade game is now very popular. Therefore, a new mode called "Top of the Mountain" is introduced. Every month, the game features a
tournament that any player can join. Whoever places in the top 100 is going to be displayed in a special leaderboard in the main menu,
so everyone can see who is the best at the game.

## Creating a leaderboard definition for versioning 

In the previous example, when creating a leaderboard definition, there was a hint about the importance of the `VersionConfiguration` 
parameter for versioning. Here, we detail how to use it and how it works.

``` C#
public static async Task CreateLeaderboardDefinitionAsync(PlayFabAuthenticationContext context, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    CreateLeaderboardDefinitionRequest leaderboardDefinitionRequest = new CreateLeaderboardDefinitionRequest()
    {
        AuthenticationContext = context,
        Name = leaderboardName,
        SizeLimit = 1000,
        EntityType = "title_player_account",
        VersionConfiguration = new VersionConfiguration()
        {
            MaxQueryableVersions = 12,
            ResetInterval = ResetInterval.Month,
        },
        Columns = new List<LeaderboardColumn>()
        {
            new LeaderboardColumn()
            {
                Name = "arcadeScoreTournament",
                SortDirection = LeaderboardSortDirection.Descending,
            }          
        }
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createLbDefinitionResult = await leaderboardsAPI.CreateLeaderboardDefinitionAsync(leaderboardDefinitionRequest);
}
```

The main difference in this example compared to the basic leaderboard is the `VersionConfiguration` parameter. This parameter allows us to define a 
`MaxQueryableVersions` setting, which specifies how many versions of the same leaderboard we can query. In this case, we set it to query 12 versions,
which allows to query the 12 more recent leaderboards. The `ResetInterval` parameter defines how often the reset process occurs. This action involves 
creating a leaderboard with the same configuration as before but empty, and the version parameter changes as follows: N = N + 1, with N = 0 at the 
creation of the leaderboard definition. 

For example, let's say we have a leaderboard with the version parameter equal to two with a hundred entries on the leaderboard. Now,
when we increase the version of that leaderboard, the result is going to be a new leaderboard with the version parameter equals to three and empty.
Meanwhile the previous leaderboard remains in the system to be query.

The `ResetInterval` can work in multiple ways. In this example, it's monthly, but it can be changed according to the developer's needs. In this particular
case, it means that the leaderboard is going to be reset automatically every month from the moment it was configured. We support the following reset strategies:
- Day
- Hour
- Manual
- Month
- Week


For more information on all available configurations, check the API documentation here: 
[API Reference Creating a Leaderboard](/rest/api/playfab/progression/leaderboards/create-leaderboard-definition)

## Incrementing the version of a leaderboard

With this new configuration, we can have multiple versions of the same leaderboard for the tournament mode. 
But what happens if we need to manually reset the leaderboard due to an issue and start over the tournament? 
In such cases, we can perform a manual reset using the API. Here's an example using the SDK:

``` C#

public static async Task ResetLeaderboards(PlayFabAuthenticationContext context, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    IncrementLeaderboardVersionRequest resetLeaderboardRequest = new IncrementLeaderboardVersionRequest()
    {
        AuthenticationContext = context,
        Name = leaderboardName,
    };

    PlayFabResult<PlayFab.LeaderboardsModels.IncrementLeaderboardVersionResponse> resetLeaderboardResponse = await leaderboardsAPI.IncrementLeaderboardVersionAsync(resetLeaderboardRequest);
}

```

## Querying for older versions

Now if we need to query for an older version of a leaderboard, we can use the `version` parameter available on all the GetLeaderboards APIs.
Here's an example using the SDK:

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
        Version = 1
    };

    PlayFabResult<GetEntityLeaderboardResponse> lbResponse = await leaderboardsAPI.GetLeaderboardAsync(getLbRequest);
    
    return lbResponse.Result.Rankings;
}
```


Now we're set to handle any challenges with versioning on leaderboards. An important aspect here is that the number of leaderboards definitions
that we decide to keep as versions are going to be metered since use storage within the service. See more about this here:
- [Leaderboards Writes](../../pricing/meters/leaderboard-meters.md).

## Conclusions 
In this tutorial, we learned how to do the following operations: 
* Create a leaderboard with right reset strategy.
* Increment the version of a leaderboard.
* Query for older versions of a leaderboard.

## See also

- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Create basic leaderboard](create-basic-leaderboard.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md).
- [Add contextual data to leaderboards](metadata-leaderboards.md).
- [API reference](api-reference.md).



