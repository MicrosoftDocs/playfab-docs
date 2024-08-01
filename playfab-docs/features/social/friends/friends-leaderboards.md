---
title: Friends Leaderboards
author: joannaleecy
description: Tutorial that describes how to create and use friends leaderboards.
ms.author: joanlee
ms.date: 10/26/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, friends lists
ms.localizationpriority: medium
---

# Friends leaderboards

Friends-specific APIs mirror the standard [GetLeaderboard](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboard) and [GetLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getleaderboardaroundplayer) API calls, but restrict the player pool to the player's friends list.


> [!NOTE]
> The [GetFriendLeaderboardAroundPlayer](xref:titleid.playfabapi.com.client.playerdatamanagement.getfriendleaderboardaroundplayer) API does *not* base the center of the leaderboard around the currently logged in player - it can be *any* PlayFab ID supplied with the request. You can use this to allow players to look up any friend's location on the leaderboard, regardless of their distance from each other.
