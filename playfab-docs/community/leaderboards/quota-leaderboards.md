---
title: Quota Leaderboards
author: braulioal
description: Learn on the quota for Leaderboards
ms.author: braulioal
ms.date: 06/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Quota Leaderboards

The Leaderboard service has quotas that vary based on your title's mode and configuration. View your title's current quota in Game Manager under **Settings** > **Limits**.

## Design considerations

The following limits apply regardless of title mode and affect how you design your leaderboards:

| Limit | Value |
| --- | --- |
| Maximum columns per leaderboard definition | 5 |
| Maximum metadata length per entry | 50 UTF-8 characters |

## See also

- [Create basic leaderboard](create-basic-leaderboard.md)
- [Doing more with leaderboards](doing-more-with-leaderboards.md)
- [Seasonal leaderboards](seasonal-leaderboards.md)
- [Group leaderboards](group-leaderboards.md)
- [Manual tiers](manual-tiers.md)
- [Limits](limits-leaderboards.md)
- [Ranking players by statistics](leaderboards-linked-to-stats.md)
- [Add contextual data to leaderboards](metadata-leaderboards.md)
- [API reference](api-reference.md)
- [Leaderboard meters](../../pricing/Meters/leaderboard-meters.md)
- [Leaderboards and Cloudscript](leaderboards-cloudscript.md).
- [Leaderboards with Playstream](leaderboards-with-playstream-and-telemetry.md)