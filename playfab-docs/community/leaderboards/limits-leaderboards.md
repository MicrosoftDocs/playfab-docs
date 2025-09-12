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

- Caller: This type of limit is enforced on the caller of the API. This constraint could be either a player or a title.
- Target: This type of limit is enforced on the target of the API, in our specific case an entity.

The following table outlines the limits for the various APIs available in the Leaderboards service. If an API isn't explicitly listed here, the default behavior is applied.

| API | Limit | Caller | Target entity |
| --- | --- | --- | --- |
| Default | 50 requests per 120 seconds | Player | `title_player_account` , `master_player_account`, `group`, `character` |
| GetLeaderboard | 30 requests per 120 seconds / 1,200 requests per 120 seconds  | Player / Title | N/A |
| GetLeaderboardAroundEntity | 30 requests per 120 seconds  | Player  | `title_player_account`, `master_player_account` , `group`, `character` |
| GetFriendLeaderboardForEntity | 30 requests per 120 seconds  | Player  | `title_player_account`, `master_player_account` , `group`, `character` |
| GetLeaderboardDefinition | 30 requests per 120 seconds  | Title  | N/A |
| ListLeaderboardDefinitions | 30 requests per 120 seconds  | Title  | N/A |
| CreateLeaderboardDefinition | 30 requests per 120 seconds  | Title  | N/A |
| UnlinkLeaderboardFromStatistic | 30 requests per 120 seconds  | Title  | N/A |
| IncrementLeaderboardVersion | 30 requests under 2 minutes  | Title  | N/A |

## Limits on Leaderboard Events

- `playfab.leaderboard.entity_rank_on_leaderboard_version_ended`
  - Only return up to the top 1000 ranks.
  - Will not work with leaderboards with a entity type of `master_player_account` or `external`.

## See also

- [Create basic leaderboard](create-basic-leaderboard.md)
- [Doing more with leaderboards](doing-more-with-leaderboards.md)
- [Seasonal leaderboards](seasonal-leaderboards.md)
- [Quota ](quota-leaderboards.md)
- [Group leaderboards](group-leaderboards.md)
- [Manual tiers](manual-tiers.md)
- [Ranking players by statistics](leaderboards-linked-to-stats.md)
- [Add contextual data to leaderboards](metadata-leaderboards.md)
- [API reference](api-reference.md)
- [Leaderboard meters](../../pricing/meters/leaderboard-meters.md)
- [Leaderboards and Cloudscript](leaderboards-cloudscript.md).
- [Leaderboards with Playstream](leaderboards-with-playstream-and-telemetry.md)
