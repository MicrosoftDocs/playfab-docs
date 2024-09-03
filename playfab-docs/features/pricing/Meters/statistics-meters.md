---
title: Statistics Meters
author: braulioal
description: Describes how the Statistics meters works.
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, meters, statistics
ms.localizationpriority: medium
---

# Statistics Meters

Statistics meters are divided into three categories.


## Statistics Reads

Whether ranked or unranked, reading statistics on an entity results in one tick of the Statistics Read meter. This applies both when requesting one or several stats for an entity.

Here's the list of APIs that tick this meter:

| API Name     | API Reference                                
|----------------------|--------------
|GetStatistics               | [Get Statistics](/rest/api/playfab/progression/statistics/get-statistics)    |
|GetStatisticsForEntities              | [Get Statistics For Entities](/rest/api/playfab/progression/statistics/get-statistics-for-entities)    |


## Statistics Writes

Whether ranked or unranked, updating statistics on an entity results in one tick of the Statistics Write meter. This is true both when updating 1 or several (batched) stats for an entity.

When ranked on a leaderboard, Statistic Writes results in ticks for the Leaderboard Write meter (in addition to the Statistic Writes meter). The number of ticks is dependent on the number of ranked stats in the request. Where N is the number of stat definitions in a request (which could be one), and M is the number of ranked stats in that set, the Leaderboard Write meter ticks M times.

Here's the list of APIs that tick this meter:

| API Name     | API Reference                                
|----------------------|--------------
|UpdateStatistics              | [Update Statistics](/rest/api/playfab/progression/statistics/update-statistics)    |


## Statistics Storage

This meter keeps track on how much statistics data is stored in the service.

For each entity statistic, the storage consumed per version of the statistic is computed as the sum of the following three:
- Scores: Length of the list of scores multiplied by `sizeof(long)`.
- Metadata: Length of the field.
- Timestamp: `sizeof(long)`.

## See Also

- [Leaderboards Meters](../../pricing/meters/leaderboard-meters.md).