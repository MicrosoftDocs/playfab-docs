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

Whether ranked or unranked, reading statistics on an entity results in one tick of the Statistics Read meter. This tick occurs both when requesting one or several stats for an entity.

Here's the list of APIs that tick this meter:

| API Name     | API Reference                                
|----------------------|--------------
|GetStatistics               | [Get Statistics](/rest/api/playfab/progression/statistics/get-statistics)    |
|GetStatisticsForEntities              | [Get Statistics For Entities](/rest/api/playfab/progression/statistics/get-statistics-for-entities)    |


## Statistics Writes

Whether ranked or unranked, updating statistics on an entity results in one tick of the Statistics Write meter. This tick occurs both when updating 1 or several (batched) stats for an entity.

When ranked on a leaderboard, Statistic Writes results in ticks for the Leaderboard Write meter (in addition to the Statistic Writes meter). The number of ticks is dependent on the number of ranked stats in the request. Where N is the number of stat definitions in a request (which could be one) and M is the number of ranked stats in that set, the Leaderboard Writes meter ticks M times.

With Community Statistics, writes on the source statistic results in ticks for one or more destinations as well. The number of ticks is dependent on the number of aggregation destinations on the source statistic. In general, it's 1 + N where N is the number of destinations. As an example, if a stat on players aggregates to just one statistic on the Title level, each update on a player causes two ticks of the Statistic Writes meter, one for the player and another for the aggregation at the Title level.

Here's the list of APIs that tick this meter:

| API Name     | API Reference                                
|----------------------|--------------
|UpdateStatistics              | [Update Statistics](/rest/api/playfab/progression/statistics/update-statistics)    |

## Transactional Writes

The Transactional Write meter is a different variant of the Statistics Writes meter, it operates under the same conditions
but adds the feature of handling requests as transactions, ensuring each request executes only once.

This meter is limited to this API and requires a special parameter for a client Transaction ID. When you provide this parameter, the Transactional Write meter is activated.

| API Name     | API Reference                                
|----------------------|--------------
|UpdateStatistics              | [Update Statistics](/rest/api/playfab/progression/statistics/update-statistics)    |



## Statistics Storage

This meter keeps track on how much statistics data is stored in the service.

For each entity statistic, the storage consumed per version of the statistic is computed as the sum of the following elements:

- Scores: Length of the list of scores multiplied by `sizeof(long)`.
- Metadata: Length of the field.
- Timestamp: `sizeof(long)`.
- Length of the entity ID.

## See Also

- [Leaderboards Meters](leaderboard-meters.md).