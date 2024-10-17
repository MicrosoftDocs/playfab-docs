---
title: Create basic leaderboard
author: braulioal
description: Learn more about how to create a basic leaderboard
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Create a basic leaderboard

In this tutorial, we show you how to create a basic leaderboard using our new Leaderboard Service. Let's start with an 
example of an arcade game where the objective is to defeat as many enemies as possible until you're defeated. When that happens,
you're assigned a score. Now, we want to create a leaderboard to help this game determine who the best player is.

## Creating a leaderboard

The first step is to create a leaderboard definition that includes the main elements for ranking players. For our arcade game,
we only need one column for the score. The following example shows how to create the leaderboard definition using the C# SDK.

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
                Name = "arcadeScore",
                SortDirection = LeaderboardSortDirection.Descending,
            }          
        }
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> createLbDefinitionResult = await leaderboardsAPI.CreateLeaderboardDefinitionAsync(leaderboardDefinitionRequest);
}
```

Now, let's explain some key elements of this example:

- `AuthenticationContext`: This parameter handles all the authentication behind every request to our services. For a detailed explanation,
you can check the following page:  [Quickstart Leaderboard](quickstart-leaderboards.md).
- `Name`: This parameter helps you identify the leaderboard definition. It's important to choose something relevant here since it's used to make other requests to retrieve information. Additionally, this name must be unique, so a new one should be used to each time a leaderboard is created.
- `EntityType`: This parameter specifies the type of entity you want to create your leaderboard for. 
You can learn more here: [Entity Programming Model](../../entities/index.md).
    - `title_player_acount`: This type of entity refers to players within PlayFab. In order to create a player, you can use the method of `LoginAsPlayer` that is described here: [Quickstart](quickstart-leaderboards.md).
    - `group`: This type of entity refers to a group of players, usually this concept applies in games like "clans," "guilds,", etc. See more information here: [Group Leaderboards](group-leaderboards.md).
    - `external`: This type of entity serves for adding custom data to our leaderboards. Each row doesn't need to be tied to anything on PlayFab, it is your own data. You can use your own identifiers in the `EntityId` field as long as they are strings.
    - `master_player_account`: This type of entity refers to players across titles. This concept applies when a studio has multiple titles and you have players that either went from one title to the other or they're playing multiple titles from the same studio. Based on this concept, you can create leaderboards of players across multiple titles from the same studio. You need to use: Master player account ID also refers as PlayFabId to map it to the `EntityId`.
    - `character`: This type of entity is related to games that has a series of characters from which a player can choose and start their journey. With this concept in mind, in order to create a leaderboard of characters you need to create a player first and then you can create a character associated to that player.
    After that, you can use the `CharacterId` as the entity id and insert a row with the corresponding score.
- `VersionConfiguration`: This parameter allows you to set a versioning strategy for leaderboards that reset themselves 
after a certain period. This concept is covered in depth here:  [Seasonal Leaderboards](seasonal-leaderboards.md).
- `Columns`: Here, we define the number of columns our leaderboard is going to have. In this example, we only set one column for the score.
We also define the `SortDirection` as descending, meaning the player with the highest score is going to be at the top.

With all of this information, you're now ready to run the example and create your first leaderboard.

### Getting a leaderboard definition

Before adding data to this leaderboard, we want to ensure that it was created correctly. To do this action, we provide an example of
how you can retrieve your leaderboard definition.

``` C#
public static async Task GetLeaderboardDefinition(PlayFabAuthenticationContext context, string leaderboardName)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    GetLeaderboardDefinitionRequest leaderboardDefReq = new GetLeaderboardDefinitionRequest()
    {
        Name = leaderboardName
    };

    PlayFabResult<GetLeaderboardDefinitionResponse> getleaderboardDefResult = await leaderboardsAPI.GetLeaderboardDefinitionAsync(leaderboardDefReq);
}
```
To retrieve the leaderboard definition, specify the name of the leaderboard you created. If you have multiple leaderboards 
definitions, you can use the next example to get a set of them.

``` C#

 public static async Task ListLeaderboards(PlayFabAuthenticationContext context)
 {
     PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
     ListLeaderboardDefinitionsRequest listLbRequest = new ListLeaderboardDefinitionsRequest()  
     {
         AuthenticationContext = context,                
     };
     PlayFabResult<PlayFab.LeaderboardsModels.ListLeaderboardDefinitionsResponse> lbResponse = await leaderboardsAPI.ListLeaderboardDefinitionsAsync(listLbRequest);
    
 }
 ```
 ### Deleting leaderboard definition

 If you want to delete your leaderboard definition to add more columns or fix some errors, you can do so as follows:

 ``` C#

 public static async Task DeleteLeaderboard(PlayFabAuthenticationContext context, string leaderboardName)
 {
     PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
     DeleteLeaderboardDefinitionRequest deleteLbRequest = new DeleteLeaderboardDefinitionRequest()
     {
         AuthenticationContext = context,
         Name = leaderboardName,
     };

     PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> lbResponse = await leaderboardsAPI.DeleteLeaderboardDefinitionAsync(deleteLbRequest);
 }
```

## Adding data to a leaderboard

Continuing with our arcade game example, we now know how to create a leaderboard definition, retrieve it, and delete it if necessary.
Our next step is to start adding data to our leaderboard.

Keep in mind that these are entity-based leaderboards, which means the entries are entities. We also support bringing your own external identities, which is discussed in detail in [Doing More With Leaderboards](doing-more-with-leaderboards.md).

In our specific example, we're using the entity type title_player_account, so our leaderboard is filled with players. 
However, remember that there are other entity types you can use as well. 
You can check them out here: [Available built-in entity types](../../entities/available-built-in-entity-types.md).

Now let's dive into how we can add data to our leaderboard.

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

Now, let's explain some key elements of this example:
- `Entries`: This parameter corresponds to the actual row added to the leaderboard. It has an `EntityId`, which is a string that 
identifies the entity within the leaderboard. Since this service is a standalone component, you can use your own identifiers here. 
However, if you're using other PlayFab services, this value should be consistent across all services.
- `Scores`: This parameter corresponds to the list of scores you can add to one entity. Remember, leaderboards can have more than one column. 
     You can check these concepts in depth here: [Doing More With Leaderboards](doing-more-with-leaderboards.md)
- `Name`: This parameter corresponds to the leaderboard name set when you created the leaderboard definition.

You're now ready to add data to your leaderboard.

## Retrieving data from a leaderboard

Let's do a quick recap. At this point, you created a leaderboard, checked all the configuration details, 
and started adding entities to it. Now, let's imagine some players already started using your game,
all with impressive scores. We want to determine who the best player is. In the following example, 
we show you how to do this action.

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
    
    return lbResponse.Result.Rankings;
}
```
Now, let's explain some key elements of this example:
- `StartingPosition`: This parameter refers to the position from which you want to start querying for data. In this case, 
we want the top player, so we set this parameter to 1. This parameter also works with the `PageSize` parameter to query 
through the entire leaderboard as needed.
- `PageSize`: This parameter specifies how many records are pulled in that request.
- `Name`: This parameter corresponds to the leaderboard name set when you created the leaderboard definition.

### Tie-breaking

Now let's imagine that some players using your game are battling to see who is the best. 
We face a problem: two players have the same score because they defeated the same number of enemies. 
So, who should be the top player?

To answer that question, we have a simple tie-breaker policy by default. We choose the best player based 
on the timestamp when the score was achieved. Whoever achieved it first is the top player. However, 
depending on the context of the game, this might not be enough or accurate. 
For more complex tie-breaking features, refer to: [Doing More With Leaderboards](doing-more-with-leaderboards.md).

In our current example the ranking would be:

| Rank     | Entity Id                         | Score          | LastUpdated                 
|----------------------|------------------------------------|-------------------|--------------------------
|1 | "player 3" | 103               | "2024-08-27T20:24:36.738Z" 
|2 | "player 2" | 102               | "2024-08-27T20:24:29.251Z" 
|3 | **"player 1"** | 100               | "2024-08-27T19:52:26.642Z"   
|4 | **"player 4"** | 100               | "2024-08-27T20:24:44.552Z"  

In this particular example, both "player 1" and "player 4" have the same score. The decision of who goes first relies on the timestamp.
Since "player 1" achieved the score first, that becomes the reason on why is on top.

## Deleting leaderboard rows

Your leaderboards are working as expected, and you have a bunch of players in your game. However, 
you start noticing some unusual behavior, as it seems some players are cheating to get to the top of 
the leaderboard. You aren't going to tolerate such behavior, so you want to remove them from your leaderboards. In the next example, you can see how to delete rows from your leaderboard.

``` C#

public static async Task DeleteLeaderboardEntries(PlayFabAuthenticationContext context, string leaderboardName, List<string> entityIds)
{
    PlayFabProgressionInstanceAPI leaderboardsAPI = new PlayFabProgressionInstanceAPI(context);
    DeleteLeaderboardEntriesRequest leaderboardsDelReq = new DeleteLeaderboardEntriesRequest() {
        Name = leaderboardName,
        EntityIds = entityIds
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> delLeaderboardDefResult = await leaderboardsAPI.DeleteLeaderboardEntriesAsync(leaderboardsDelReq);
}

```

Now, let's explain some key elements of this example:
- `EntityIds`: This parameter is the list of entity ids that you want to delete.
- `Name`: This parameter corresponds to the leaderboard name set when you created the leaderboard definition.

## Conclusions

In this tutorial, we learned how to do the following operations: 
* Create a leaderboard.
* Check the configuration of a leaderboard.
* Delete the leaderboard configuration.
* Populate the leaderboard.
* Understand how tie-breaking works.
* Delete entries in the leaderboard. 

## See also

- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Seasonal leaderboards](seasonal-leaderboards.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md).
- [Add contextual data to leaderboards](metadata-leaderboards.md).
- [Group leaderboards](group-leaderboards.md).
- [API reference](api-reference.md).




