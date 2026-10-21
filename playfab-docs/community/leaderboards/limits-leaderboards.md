---
title: Limits on Leaderboards
author: braulioal
description: Learn more about the limits on the Leaderboards service
ms.author: braulioal
ms.date: 06/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Limits on Leaderboards

The Leaderboards service enforces API rate limits that vary based on your title's mode and configuration.

View your title's current API rate limits in Game Manager under **Settings** > **Limits** > [**API Rate Limits**](../../live-service-management/service-gateway/throttling/what-is-throttling.md#view-your-titles-api-rate-limits).

## Limits on Leaderboard Events

- `playfab.leaderboard.entity_rank_on_leaderboard_version_ended`
  - Only returns up to the top 1000 ranks.
  - Doesn't work with leaderboards that use an entity type of `master_player_account` or `external`.

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
- [Leaderboard meters](../../pricing/Meters/leaderboard-meters.md)
- [Leaderboards and Cloudscript](leaderboards-cloudscript.md).
- [Leaderboards with Playstream](leaderboards-with-playstream-and-telemetry.md)
