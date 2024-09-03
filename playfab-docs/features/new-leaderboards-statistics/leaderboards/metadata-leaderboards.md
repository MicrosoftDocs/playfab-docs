---
title: Add Contextual Data to Leaderboards
author: braulioal
description: Learn how to metadata to a leaderboard.
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Add contextual data to leaderboards

In this tutorial, we're going to explain how to add contextual information whenever a leaderboard is updated. The game studio might want to add some details about the context in which a player achieved a score, or there could be a feature within the game that relates to that given score.

Now we're going to switch from our previous examples, where we had an arcade game, to a highly competitive shooter game. In this example,
the game has tremendous success but is facing a challenge. There are too many complaints about people "hacking" the game with external 
components that remove recoil on the weapons and improve the aim assist. So now we're tasked with tracking more information about all 
the components used and network information for our ranked matches.

## Creating a leaderboard

To show how to deal with this scenario, we're going to take the leaderboard definition from the 
[Doing More With Leaderboards](doing-more-with-leaderboards.md) page. From this definition, we're going 
to see how to add metadata to every row added to the leaderboard.

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

### Adding metadata to each row

We want to know if the player has any unauthorized hardware that affects gameplay or any other malicious software that could
enhance the player's performance. The anti-cheat system is capable of getting all of this information, but because there's an 
enormous number of players, we're going to focus on flag-checking high scores plus metadata from external components.

To perform this action, we're going to use the UpdateLeaderboard API. Here we can check the SDK example:

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
                Metadata = "AntiCheat Data",
            }
        },
        AuthenticationContext = context,
        LeaderboardName = leaderboardName,
    };

    PlayFabResult<PlayFab.LeaderboardsModels.EmptyResponse> updateResult = await leaderboardsAPI.UpdateLeaderboardEntriesAsync(updateLeaderboardRequest);
}
```
Here, we use the `Metadata` parameter within the `LeaderboardEntryUpdate` to add information is meaningful for a developer. In this case, we use it to store anti-cheat data. With this example, we're now equipped to track all relevant information from our top players, enabling game moderators 
to make better decisions on who to ban.



## Conclusions 
In this tutorial, we learned how to do the following operations: 
* Create a multi-column leaderboard.
* Add metadata to each row of the leaderboard.


## See also
- [Doing More With Leaderboards](doing-more-with-leaderboards.md).
- [Create Basic Leaderboard](create-basic-leaderboard.md)
- [Ranking Players by Stats](leaderboards-linked-to-stats.md)
- [Add Contextual Data to Leaderboards](metadata-leaderboards.md)
- [API Reference](api-reference.md)


