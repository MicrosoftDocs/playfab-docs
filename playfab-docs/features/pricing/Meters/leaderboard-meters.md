---
title: Leaderboards Meters
author: braulioal
description: Describes how the Leaderboards meters works.
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, meters, leaderboards
ms.localizationpriority: medium
---

# Leaderboards Meters

Leaderboards meters are divided into three categories.

## Leaderboard Reads
Whether based on ranked stats or otherwise, Leaderboard Reads are dependent on the size of a leaderboard in the 
API response. If a request returns N entries, then the meter is ticked N/10 times, rounded up. 
Note that *N* is influenced by the request parameters and leaderboard size.

Here's the list of APIs that tick this meter:

| API Name     | API Reference                                
|----------------------|--------------
|GetFriendLeaderboardForEntity               | [Get Friend Leaderboard For Entity](/rest/api/playfab/progression/leaderboards/get-friend-leaderboard-for-entity)    |
|GetLeaderboard               | [Get Leaderboard](/rest/api/playfab/progression/leaderboards/get-leaderboard)    |
|GetLeaderboardAroundEntity              | [Get Leaderboard Around Entity](/rest/api/playfab/progression/leaderboards/get-leaderboard-around-entity)    |
|GetLeaderboardForEntities              | [Get Leaderboard For Entities](/rest/api/playfab/progression/leaderboards/get-leaderboard-for-entities)    |


## Leaderboard Writes
A request to update N entries on a standalone leaderboard (for example, those leaderboards not based on ranked stats), ticks the Leaderboard 
Meter N times. For leaderboards based on ranked stats, both the Statistic Write and Leaderboards Write meter are impacted. For more information, see Statistic Write.

Here's the list of APIs that tick this meter:

| API Name     | API Reference                                
|----------------------|--------------
|UpdateLeaderboardEntries              | [Update Leaderboard Entries](/rest/api/playfab/progression/leaderboards/update-leaderboard-entries)    |


## Leaderboard Storage

This meter keeps track on how much statistics data is stored in the service.

For each leaderboard entry, the storage consumed is computed as the sum of the following three:
- Scores: Length of the list of scores multiplied by `sizeof(long)`.
- Metadata: Length of the field.
- Timestamp: `sizeof(long)`.

## See Also

- [Statistics Meters](../../pricing/meters/statistics-meters.md).