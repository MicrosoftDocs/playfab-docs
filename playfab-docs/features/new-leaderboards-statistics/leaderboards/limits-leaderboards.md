---
title: Limits on Leaderboards
author: braulioal
description: Learn more about the limits on the Leaderboards service
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Limits on Leaderboards

The purpose of this guide is to detail the limits that are enforced when creating, updating, and reading from your leaderboards on the Leaderboards service.
- Caller: This type of limit is enforced on the caller of the API, this could be either a player or a title.
- Target: This type of limit is enforced on the target of the API, in our specific case an entity.

The following table defines the limits for the different set of APIs available on the Leaderboards service, now if
the API doesn't explicitly appear here, it means that the default behavior is going to be applied.

| API | Limit | Caller | Target entity |
| --- | --- | --- | --- |
| Default | 50 requests under 2 minutes | Player | title_player_account |
| GetLeaderboard | 30 requests under 2 minutes / 1200 requests under 2 minutes  | Player / Title | N/A |
| GetLeaderboardAroundEntity | 30 requests under 2 minutes  | Player  | title_player_account |
| GetFriendLeaderboardForEntity | 30 requests under 2 minutes  | Player  | title_player_account |
| GetLeaderboardDefinition | 30 requests under 2 minutes  | Title  | N/A |
| ListLeaderboardDefinitions | 30 requests under 2 minutes  | Title  | N/A |
| CreateLeaderboardDefinition | 30 requests under 2 minutes  | Title  | N/A |
| UnlinkLeaderboardFromStatistic | 30 requests under 2 minutes  | Title  | N/A |
| IncrementLeaderboardVersion | 30 requests under 2 minutes  | Title  | N/A |
| UpdateLeaderboardEntries | 30 requests per entity under 2 minutes | Title  | title_player_account, group, character |
| DeleteLeaderboardEntries | 30 requests per entity under 2 minutes | Title  | title_player_account, group, character |
| GetLeaderboardForEntities | 30 requests per entity under 2 minutes | Title  | title_player_account, group, character |

NOTE: The last three APIs (UpdateLeaderboardEntries,DeleteLeaderboardEntries and GetLeaderboardForEntities) receives a list of entites as a parameter, the limit is enforced per each entity in the list, so that
the limit of 30 requests applies independently to each entity in the list.

## API callers

The following table defines which type of entity is allow to call each API:

| API | Caller |
| --- | --- |
|CreateLeaderboardDefinition | Title |
|DeleteLeaderboardDefinition | Title | 
|UpdateLeaderboardDefinition | Title | 
|DeleteLeaderboardEntries  |   Title, title_player_account  |
|GetLeaderboardDefinition  |  Title | 
|IncrementLeaderboardVersion | Title |
|ListLeaderboardDefinitions  | Title |
|UnlinkLeaderboardFromStatistic | Title |
|GetFriendLeaderboardForEntity | Title, title_player_account  |
|GetLeaderboard |   Title, title_player_account  |            
|GetLeaderboardAroundEntity | Title, title_player_account  |
|GetLeaderboardForEntities  |  Title |
|UpdateLeaderboardEntries  |  Title, title_player_account  |
    		

## See also

- [Create basic leaderboard](create-basic-leaderboard.md).
- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Seasonal leaderboards](seasonal-leaderboards.md).
- [Group leaderboards](group-leaderboards.md).
- [Manual tiers](manual-tiers.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md).
- [Add contextual data to leaderboards](metadata-leaderboards.md).
- [API reference](api-reference.md).
- [Leaderboard meters](../../pricing/meters/leaderboard-meters.md).