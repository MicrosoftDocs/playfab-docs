---
title: Using player statistics
author: williacj
description: Describes how to create and use player statistics in the PlayFab Game Manager.
ms.author: cjwill
ms.date: 06/11/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, game manager, player data, statistics
ms.localizationpriority: medium
---

# Using player statistics

This tutorial describes how to create and use player statistics. Player statistics are stored as Key Value Pairs (KVPs) where the Key is a string, and the Value is a 32-bit integer (for compatibility with languages that don't support 64-bit).

Player statistics are also used by leaderboards, but this guide only covers player statistics exclusively. If you wish to read about how player statistics and leaderboards work *together*, read our tutorial [Using resettable statistics and leaderboards](../social/tournaments-leaderboards/using-resettable-statistics-and-leaderboards.md).

> [!NOTE]
> In some documentation and API calls, you may find the term **UserStatistics**. For the purposes of this discussion, the terms *user* and *player* are identical and interchangeable. In the **Game Manager** page, the **Players** tab provides access to the **Users/Players** for your title, and within that, their statistics. Player statistics refers specifically to information bound to a player, not analytics information about player.

## Client API

The client has access to read player statistics, but to prevent cheating, the client isn't able to update statistics by default.

To enable this:

- [Log into PlayFab](https://developer.playfab.com/en-us/my-games)
- Select your **Title**.
- Select **Settings** from the left-menu.
- Select the **API Features** tab.
- Find and activate **Allow client to post player statistics**.

> [!NOTE]
> Doing this disables a security layer for your title, allowing players to post arbitrary scores to all of their statistics. If your game has *any* competitive play aspect, we would recommend that you *never* post statistics from the client.

## Statistics are public information

There are no private or server-only statistics. A player can always read all of their own statistics via [GetPlayerStatistics](xref:titleid.playfabapi.com.client.playerdatamanagement.getplayerstatistics), and  can read all other players' statistics via leaderboard API calls. This is true even if you *don't* display a statistic in-game, or use leaderboards.

The only exception to this would be if you disable client features through our [API Access Policy](../../api-references/api-access-policy.md). Refer to that link for more information on how to use the policy settings for titles, as that is an advanced topic, which isn't covered by this tutorial.

## Setting statistics

The following Unity/C# code creates (or updates if it already exists) a *strength statistic* value for a player.

```csharp
PlayFabClientAPI.UpdatePlayerStatistics( new UpdatePlayerStatisticsRequest {
    // request.Statistics is a list, so multiple StatisticUpdate objects can be defined if required.
    Statistics = new List<StatisticUpdate> {
        new StatisticUpdate { StatisticName = "strength", Value = 18 },
    }
},
result => { Debug.Log("User statistics updated"); },
error => { Debug.LogError(error.GenerateErrorReport()); });
```

## Getting statistics

The following Unity/C# code retrieves all current statistic values for a player.

```csharp
void GetStatistics()
{
    PlayFabClientAPI.GetPlayerStatistics(
        new GetPlayerStatisticsRequest(),
        OnGetStatistics,
        error => Debug.LogError(error.GenerateErrorReport())
    );
}

void OnGetStatistics(GetPlayerStatisticsResult result)
{
    Debug.Log("Received the following Statistics:");
    foreach (var eachStat in result.Statistics)
        Debug.Log("Statistic (" + eachStat.StatisticName + "): " + eachStat.Value);
}
```

## Aggregation method

PlayFab supports some convenience options for Statistic Aggregation. The four options include:

- **Last**
- **Min**
- **Max**
- **Sum**

You can create a statistic definition via the [CreatePlayerStatisticDefinition](xref:titleid.playfabapi.com.admin.playerdatamanagement.createplayerstatisticdefinition) API call, though it's not required. Any call to update a player statistic for the title will *automatically* create the default statistic definition, using the Last Aggregation method.

To change a statistic aggregation method, you can use the Game Manager or the [UpdatePlayerStatisticDefinition](xref:titleid.playfabapi.com.admin.playerdatamanagement.updateplayerstatisticdefinition) API call.

To edit a statistic definition in **Game Manager**:

- Log into [PlayFab](https://developer.playfab.com/en-us/my-games)
- Select your **Title**.
- Select **Leaderboards** from the menu on the left (**Statistics** and **Leaderboards** are closely related).
- Select the existing statistic you want to modify, or -
- Select the **New Leaderboard** button.
  - For an existing statistic, you'll have another page, with an **Edit Leaderboard** button.

- At this point you should see the page shown below.

  ![PlayFab Leaderboards - Edit Leaderboard - Stat aggregation](media/tutorials/playfab-edit-leaderboard-stat-aggregation.png)  

Some examples of how to use statistic aggregation:

- **Max** and **Min** can be used to save **best/worst** scores such as Headshots or Accuracy:
  - In short, they apply the rule of: **if this is higher (or lower) than the existing score, update the score**.
  - Post the statistic for the session ending, and the **Min/Max Aggregation** takes care of whether or not to update.
  - These can be very useful for [resettable leaderboards](../social/tournaments-leaderboards/using-resettable-statistics-and-leaderboards.md), as well as a [PlayStream Rule](https://playfab.com/introducing-playstream/) that grants achievements.

- **Sum** could be used to save experience points:
  - You post the experience gained this battle, and it's added to the existing statistic value for the player.

- **Last** allows you to manage the stat yourself:
  - Each time you post a statistic, the most recent value is used.

## Leaderboards

A leaderboard is generated for all statistics saved in PlayFab. Accessing a leaderboard for a specific stat is optional.

Reset frequency and aggregation methods play a major role in how dynamic the leaderboards are in your game. The **Tournaments** feature focuses on leaderboards with automatic reset frequencies, and is described in the tutorial [Using resettable statistics and leaderboards](../social/tournaments-leaderboards/using-resettable-statistics-and-leaderboards.md).

We encourage you to use statistics in every manner relevant to your game. You can use resettable statistics to run daily tournaments, and long-term statistics like experience points, side-by-side.
