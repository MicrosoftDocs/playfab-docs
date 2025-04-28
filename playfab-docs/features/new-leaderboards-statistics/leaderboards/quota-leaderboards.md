---
title: Quota Leaderboards
author: braulioal
description: Learn on the quota for Leaderboards
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Quota limits leaderboards

The Leaderboard service is designed to align with PlayFab's pricing models, offering two distinct modes: 
development and live. The development mode allows titles to test each feature and begin development. 
The live mode, on the other hand, is optimized for handling larger traffic loads typical of a live game.

The following tables outlines the limits for each of these modes:

## Development Mode

| Limit | Quantity |
| --- | --- |
| Leaderboard Definitions | 50 definitions |
| Row limit | 10 000 rows |
| Number of versions | 1 version |

## Live Mode


| Limit |Quantity|
| --- | --- 
| Leaderboard Definitions | 1000 definitions 
| Row limit | 1 million rows 
| Number of versions | No limit 

Each paid plan has specific limits regarding reads, writes, and storage. For more detailed information, please refer to the documentation.
[PlayFab pricing page](https://playfab.com/pricing/). 



## See also

- [Create basic leaderboard](create-basic-leaderboard.md).
- [Doing more with leaderboards](doing-more-with-leaderboards.md).
- [Seasonal leaderboards](seasonal-leaderboards.md).
- [Group leaderboards](group-leaderboards.md).
- [Manual tiers](manual-tiers.md).
- [Limits Leaderboards](limits-leaderboards.md).
- [Ranking players by statistics](leaderboards-linked-to-stats.md).
- [Add contextual data to leaderboards](metadata-leaderboards.md).
- [API reference](api-reference.md).
- [Leaderboard meters](../../pricing/meters/leaderboard-meters.md).