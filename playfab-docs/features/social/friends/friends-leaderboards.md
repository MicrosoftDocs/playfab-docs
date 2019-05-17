---
title: Friends Leaderboards
author: v-thopra
description: Tutorial that describes how to create and use friends leaderboards.
ms.author: v-thopra
ms.date: 10/26/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, social, friends lists
ms.localizationpriority: medium
---

# Friends leaderboards

Friends-specific APIs mirror the standard [GetLeaderboard](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboard) and [GetLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboardaroundplayer) API calls, but restrict the player pool to the player's friends list.

For more information on this subject, please refer to our tutorials about [Tournaments and Leaderboards](../tournaments-leaderboards/tutorials.md).

> [!NOTE]
> The [GetFriendLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getfriendleaderboardaroundplayer) API does *not* focus the center of the leaderboard around the currently logged in player - it can be any PlayFab ID supplied with the request. You can use this to allow players to look up any friend's location on the leaderboard, regardless of their distance from each other.
