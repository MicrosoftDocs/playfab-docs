---
title: Group Leaderboards
author: braulioal
description: Learn how to work with group entities on leaderboards
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Group leaderboards

In this tutorial, we're going to learn how to use group entities on a leaderboard. For understanding this concept,
we're going to start with an example of an "RPG" game which focuses on terraforming planets. As a player you need to build and develop structures 
on each planet, gather resources, create your own ships and also set up defenses because other players could attack you to steal your things.
Now, one key aspect of this game is that players can start alliances with the objective of creating a team and attack other players as a group.

With this context in mind we want to create a leaderboard for alliances, so we're able to know which is the stronger alliance 
in the whole universe.

Some key aspects to have in mind before going deeper into how group leaderboards works:
* Learn more about the Entity Programming Model here: [Entity Programming Model](../../entities/index.md).
* Check out how groups work here: [Groups](../../social/groups/quickstart.md).

## Creating a leaderboard

Depending on the game and the type of scenarios that you're going have, you're most likely going to create multiple leaderboards.
In this particular context, we want to show to different scenarios for this game and how to use the service to address each of them.

### Players leaderboards

On this example, we have players that are terraforming planets and they're gaining experience points by doing certain actions in the game.
So we're going to have a leaderboard for tracking that experience at the player level. This process follows the same behavior
as it was presented on other tutorials like the [Create basic leaderboard](create-basic-leaderboard.md). Now the key aspect here
is that EntityType parameter needs to be `"title_player_account"` so it going to be only for players.

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
                Name = "XP",
                SortDirection = LeaderboardSortDirection.Descending,
            }        
        }
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createLbDefinitionResult = await leaderboardsAPI.CreateLeaderboardDefinitionAsync(leaderboardDefinitionRequest);
}
```

### Group leaderboards

Now let's go into the aspect of the game that was given in the example, alliances. So we can create alliances in PlayFab by using
the `"group"` entity. This group entity allows us to have a structure for which player can join, it also has roles and other interesting features that 
empower this type of scenarios in games. For the creation of the leaderboard we need to have to two things clear.

- The EntityType parameter needs to be `"group"`.
- This leaderboard is independent. So adding a score for an alliance is manual process separated from the players leaderboard. This behavior 
allows different ways in which the scores are related to the players or it could be a new metric only applicable for groups.

``` C#
public static async Task CreateLeaderboardDefinitionAsync(PlayFabAuthenticationContext context, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    CreateLeaderboardDefinitionRequest leaderboardDefinitionRequest = new CreateLeaderboardDefinitionRequest()
    {
        AuthenticationContext = context,
        Name = leaderboardName,
        SizeLimit = 1000,
        EntityType = "group",
        VersionConfiguration = new VersionConfiguration()
        {
            MaxQueryableVersions = 1,
            ResetInterval = ResetInterval.Manual,
        },
        Columns = new List<LeaderboardColumn>()
        {
            new LeaderboardColumn()
            {
                Name = "Group XP",
                SortDirection = LeaderboardSortDirection.Descending,
            }        
        }
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createLbDefinitionResult = await leaderboardsAPI.CreateLeaderboardDefinitionAsync(leaderboardDefinitionRequest);
}
```


## Adding data to the leaderboard

After we created both leaderboards, we need to see how can we add data to them. Now as it was mentioned before in the previous example,
these leaderboards are independent of each other; which gives the developer the control of applying custom logic on 
how scores work for alliances (groups). 

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
                Scores = new List<string> { score.ToString()}                
            }
        },
        AuthenticationContext = context,
        LeaderboardName = leaderboardName,
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> updateResult = await leaderboardsAPI.UpdateLeaderboardEntriesAsync(updateLeaderboardRequest);
}
```

The code for adding entries to the players leaderboard or the group leaderboard is same in this scenario. But this behavior isn't 
always true, because we could have a leaderboard with five columns for players; but then we could have another leaderboard for groups with only one column.
We describe more about multi-column leaderboard on this tutorial: [Doing more with leaderboards](doing-more-with-leaderboards.md).

Something to keep always in mind is that you need to provide the correct `EntityId` to the service. If you have a leaderboard of players
the entities are `"title_player_account"` if the leaderboard is composed by groups then you need to provide entities that are `"group`.


## Retrieve data from the leaderboard

Now, to get the data of the leaderboard we have all the options described in here [Doing more with leaderboards](doing-more-with-leaderboards.md)  except for the GetFriendLeaderboard API.

## Display name for groups leaderboards

Finally, another detail that we can do with group leaderboards is to set the display name with the group name of the entity.
So if you have an alliance called: "Raiders", this group name is going to be map to the entity with the `DisplayName` property.
``` C#
public static async Task<CreateGroupResponse> CreateGroup(string groupName, PlayFabAuthenticationContext context)
{
    var request = new CreateGroupRequest
    {
        GroupName = groupName,
        AuthenticationContext = context
    };
    var response = await PlayFabGroupsAPI.CreateGroupAsync(request);

    SetDisplayNameRequest displayRequest = new SetDisplayNameRequest()
    {
        AuthenticationContext = context,
        DisplayName = groupName,
        Entity = new PlayFab.ProfilesModels.EntityKey()
        {
            Id = response.Result.Group.Id,
            Type = "group",
        },
    };

    PlayFabResult<SetDisplayNameResponse> updateNameResult = await PlayFabProfilesAPI.SetDisplayNameAsync(displayRequest);

    return response.Result;
}
```

In this example. we create a group by calling the `CreateGroupAsync` method. The first step of this execution is to return the Group object,
which we're going to use for setting the display name. We do this process by mapping the group name to the entity by using the
`SetDisplayNameRequest` object and then executing the `PlayFabProfilesAPI.SetDisplayNameAsync` method.

## Conclusions 
In this tutorial, we learned how to do the following operations: 
* Create a group leaderboard.
* Learn how to feed data to that leaderboard.
* Retrieve the leaderboard.
* Change the displayName so it can show the group name.


## See also
- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Create basic leaderboard](create-basic-leaderboard.md)
- [Ranking players by statistics](leaderboards-linked-to-stats.md)
- [Add contextual data to leaderboards](metadata-leaderboards.md)
- [API reference](api-reference.md)


