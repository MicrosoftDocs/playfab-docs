---
title: Doing with more leaderboards
author: braulioal
description: Learn how about the advanced features of leaderboards
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Doing with more leaderboards

In this tutorial, we're going to cover advanced features that the service has to offer, such as creating multi-column
leaderboards, enhanced tie-breaking, and multiple ways to query the leaderboard.

For this example, we're going to assume that everything presented here in [Create Basic Leaderboard](create-basic-leaderboard.md)
is familiar. We're going to start with highly competitive shooter as an example of how these new features could help us solve
some problems. In this game, there's a mode called Team Death match, which consists of two teams facing each other. Whoever gets to 
75 eliminations first is the winner. Now, this game isn't based on a single score to rank players; instead, it's based on the number
of eliminations, assists, and deaths to define who is the best.

## Creating a multi-Column leaderboard definition

To begin with this example, we need to create a more complex leaderboard definition than the one we had before.
We're going to define multiple columns to map the key aspects of the game: eliminations, assists, and deaths.
The following example shows how to create the leaderboard definition using the C# SDK.

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
                Name = "Assists",
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

Now, let's explain some key elements of this example:

- `SizeLimit`: This parameter is used for limiting the number of rows that the leaderboard could have. The value here's just an example.
- `VersionConfiguration`: This parameter allows us to have versioning on our leaderboards. See this page for 
more information: [Seasonal Leaderboards](seasonal-leaderboards.md)
- `Columns`: This parameter allows us to define multiple columns. As you can see we set up Eliminations, Assists and Deaths.
An important element here's the `SortDirection` parameter, which allows us to determine the sorting of the leaderboard. 
In this example, a player is ranked higher if they have more eliminations and assists (SortDirection = Descending) and 
fewer deaths (SortDirection = Ascending).

For more information about other parameters or how to manage leaderboards definitions, see [Create Basic Leaderboard](create-basic-leaderboard.md).

## Bring external entities

The Leaderboard service can be used as standalone component supports bringing external entities that only make sense in the context of the game. If your player identities aren't tied with the PlayFab login, you can still use the Leaderboards service. The entity type for the entries on the leaderboard outside of PlayFab system must be *external*. The entityId is then the identity of the player in your system. In these cases, *all* entries on the leaderboard must be *external* entities.

## Adding data to a leaderboard

Now that we have our leaderboard created, we're going to add data. The main difference from our previous tutorial on this subject is 
that now we need to add three different scores in the same row. The following example shows how to add data to our leaderboard 
using the C# SDK.

``` C#
public static async Task UpdateLeaderboardForPlayer(PlayFabAuthenticationContext context, string leaderboardName, string entityId, int score)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    UpdateLeaderboardEntriesRequest updateLeaderboardRequest = new UpdateLeaderboardEntriesRequest()
    {
        Entries = new List<LeaderboardEntryUpdate>()
        {
            new LeaderboardEntryUpdate()
            {
                EntityId = entityId,
                Scores = new List<string> { score.ToString(), (score + 1).ToString(), (score + 2).ToString() },
                Metadata = "metadata",
            }
        },
        AuthenticationContext = context,
        LeaderboardName = leaderboardName,
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> updateResult = await leaderboardsAPI.UpdateLeaderboardEntriesAsync(updateLeaderboardRequest);
}
```
And important thing to note is that Scores parameter is given three values. The length of the list of scores specified for any entry must match the number of columns of the leaderboard definition. Each of the values must be a valid 64-bit integer (the string representation is only to ensure that all clients can handle 64-bit values).

## Retrieving data from a leaderboard

Now we're going to learn different ways to query a leaderboard. All of them have a specific purpose with the intention 
of helping developers to get the players they need, to display in the game.

### Getting leaderboard around an entity

This particular way of querying the leaderboard lets us get a section of the leaderboard close to a specific entity. A practical
way to see this scenario is whenever we have a huge leaderboard and we only want to show relevant information to the player that is active 
in the game. If the player is in position 1000, we can show the close-by neighbors instead of the top players.
The following example shows how to query a leaderboard around an entity using the C# SDK.

``` C#
public static async Task<List<EntityLeaderboardEntry>> GetLeaderboardAroundEntity(PlayFabAuthenticationContext context, string leaderboardName, string entityId)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    GetLeaderboardAroundEntityRequest getLbRequest = new GetLeaderboardAroundEntityRequest()
    {
        LeaderboardName = leaderboardName,
        AuthenticationContext = context,
        Entity = new PlayFab.LeaderboardsModels.EntityKey()
        {
            Id = entityId,
            Type = EntityType
        },
        MaxSurroundingEntries = 20,
    };

    PlayFabResult<GetEntityLeaderboardResponse> lbResponse = await leaderboardsAPI.GetLeaderboardAroundEntityAsync(getLbRequest);
    
    return lbResponse.Result.Rankings;

}
```

The most important element here's the `MaxSurroundingEntries`, which allows us to extract entities ranked around a specific entity 
from the leaderboard. For example, if we have a player in the position 100 and we use
the `MaxSurroundingEntries` = 20 then it retrieves players from the position 90 to the 110. If the player is at the top
of the leaderboard, it retrieves the top 20 results. If the player is at the bottom, it retrieves the last 20 results. Barring the positions at the top and bottom of the leaderboard, the API tries to ensure the entity around which the ranking is requested, is at the center of the retrieved positions.

### Getting leaderboard for entities

This API gives us another way of querying the leaderboard. It works for whenever we have a case in which we want to search multiple entities within 
the leaderboard and sort them. The following example shows how to query a leaderboard for a list of entities 
using the C# SDK.

``` C#
public static async Task<List<EntityLeaderboardEntry>> GetLeaderboardForEntities(PlayFabAuthenticationContext context, string leaderboardName, List<string> entityIds)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    GetLeaderboardForEntitiesRequest getLbRequest = new GetLeaderboardForEntitiesRequest()
    {
        LeaderboardName = leaderboardName,
        AuthenticationContext = context,
        EntityIds = entityIds,
    };

    PlayFabResult<GetEntityLeaderboardResponse> lbResponse = await leaderboardsAPI.GetLeaderboardForEntitiesAsync(getLbRequest);

    return lbResponse.Result.Rankings;
}
```

### Getting friends leaderboards

There could be cases in which some casual players come around and play a game. They might be far away from the top of the leaderboard, but among their friends, they have a competition going on. With this API, we can query the leaderboard and find the friends of the player.

``` C#
public static async Task<List<EntityLeaderboardEntry>> GetFriendLeaderboardForEntity(PlayFabAuthenticationContext context, string leaderboardName, string entityId)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    GetFriendLeaderboardForEntityRequest getLbRequest = new GetFriendLeaderboardForEntityRequest()
    {
       LeaderboardName = leaderboardName,
       Entity = new PlayFab.LeaderboardsModels.EntityKey()
       {
           Id = entityId,
           Type = EntityType
       },
    };

    PlayFabResult<GetEntityLeaderboardResponse> lbResponse = await leaderboardsAPI.GetFriendLeaderboardForEntityAsync(getLbRequest);
  
    return lbResponse.Result.Rankings;
}
```

There are multiple ways to get friends from the PlayFab Services. For more information about the available parameters, see [API Reference](api-reference.md).

### Enhance tie-breaking

Considering our example of a highly competitive shooter, there are cases in which multiple players could have the same number of 
eliminations. For those scenarios, we need to have a different way to tie-break those cases. This scenario is where the enhanced tie-breaking 
functionality comes into play.

When you create a leaderboard definition, you can have multiple columns. The way in which you add them determines how we're going to 
sort and tie-break some scenarios. There's a precedence order, in which the first column added is the most important, then the second
one, and so forth. This scenario translates into our example, that whenever there's a tie in eliminations, then the second criterion is the number of assists,
and the final criterion is deaths. In the extreme case that the tie still persists, then it defaults to timestamp,
whoever achieved the scores first.

| Rank     | Entity Id                         | Eliminations|  Assists        | Deaths | LastUpdated                 
|----------------------|------------------------------------|-------------------|--------------------------
|1 | "player 3" | 103               |24 | 15|"2024-08-27T20:24:36.738Z" 
|2 | "player 2" | 102               | 30| 20 |"2024-08-27T20:24:29.251Z" 
|3 | **"player 1"** | 100               | 25 |18 |"2024-08-27T19:52:26.642Z"   
|4 | **"player 4"** | 100               | 25 | 18 |"2024-08-27T20:24:44.552Z" 
|4 | **"player 5"** | 100               | 25 | 19 |"2024-08-27T20:25:47.552Z" 

In this example, we have a tie between three players:

- "player 5": Despite having the same amount of eliminations and assists, they have more deaths, which means that they are at the
bottom of the leaderboard.
- "player 4": This player has fewer deaths than "player 5", and the same amount as "player 1", but player 1 gained these numbers first.
- "player 1": Despite having the same numbers as "player 4", this player was the first to achieve this score in the game, therefore they're ranked higher in this tie-break scenario.


## Conclusions

In this tutorial, we learned how to do the following operations: 
* Create a multi-column leaderboard.
* Check the multiple ways of querying.
* Understand the enhance tie-breaking mechanism.
 
## See also
- [Create basic leaderboard](create-basic-leaderboard.md).
- [Seasonal leaderboards](seasonal-leaderboards.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md).
- [Add extra data to leaderboards](metadata-leaderboards.md).
- [API reference](api-reference.md).





