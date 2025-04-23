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

# Quota limits

The Leaderboard service is designed to align with PlayFab's pricing models, offering two distinct modes: 
development and live. The development mode allows titles to test each feature and begin development. 
The live mode, on the other hand, is optimized for handling larger traffic loads typical of a live game.

The following table outlines the limits for each of these modes:

## Development Mode

| Limit | Quantity |
| --- | --- |
| Reads | 5 million reads |
| Writes | 1 million writes |
| Leaderboard Definitions | 50 definitions |
| Row limit | 10 000 rows |
| Number of versions | 1 version |

## Live Mode
There are two paid plans, each offering different capabilities. If your title needs to exceed these limits, 
you can reach out to the PlayFab team for further assistance.

| Limit | Standard Plan |Premium Plan|
| --- | --- |--- |
| Reads |30 million reads | 500 million reads|
| Writes | 15 million writes | 250 million writes|
| Leaderboard Definitions | 1000 definitions | 1000 definitions
| Row limit | 1 million rows | 1 million rows|
| Number of versions | No limit | No limit|

There is also the Pay as you go plan, which has no limits and charges based on usage.

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