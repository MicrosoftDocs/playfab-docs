---
title: Limits on Statistics
author: braulioal
description: Learn more about the limits on the Statistics service
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Limits on Statistics

The purpose of this guide is to detail the limits that are enforced when creating, updating, and reading from your statistics on the Statistic service.
- Caller: This type of limit is enforced on the caller of the API, this could be either a player or a title.
- Target: This type of limit is enforced on the target of the API, in our specific case an entity.

The following table defines the limits for the different set of APIs available on the Statistics service, now if
the API doesn't explicitly appear here, it means that the default behavior is going to be applied.

| API | Limit | Caller | Target entity |
| --- | --- | --- | --- |
| Default | 50 requests under 2 minutes | Player | title_player_account |
| GetStatistics | 30 requests under 2 minutes / 1200 requests under 2 minutes  | Player / Title | title_player_account, master_player_account |
| UpdateStatistics | 30 requests under 2 minutes  | Title  | title_player_account |
| DeleteStatistics | 30 requests under 2 minutes  | Title  | title_player_account |
| CreateStatisticDefinition | 30 requests under 2 minutes  | Title  | N/A |
| GetStatisticDefinition | 30 requests under 2 minutes  | Title  |  N/A |
| ListStatisticDefinitions | 30 requests under 2 minutes  | Title  |  N/A |
| DeleteStatisticsDefinition | 30 requests under 2 minutes  | Title  |  N/A |
| IncrementStatisticVersion | 30 requests under 2 minutes  | Title  |  N/A |
| GetStatisticsForEntities | 30 requests per entity under 2 minutes | Title  | title_player_account, group, character |

NOTE: The last API (GetStatisticsForEntities) receives a list of entites as a parameter, the limit is enforced per each entity in the list, so that
the limit of 30 requests applies independently to each entity in the list.

## API callers

The following table defines which type of entity is allow to call each API:

| API | Caller |
| --- | --- |
|CreateStatisticDefinition | Title |
|DeleteStatisticDefinition | Title |
|UpdateStatisticDefinition | Title |
|DeleteStatistic           | Title, title_player_account  |
|GetStatisticDefinition    | Title |
|ListStatisticDefinitions  | Title |
|IncrementStatisticVersion | Title |
|GetStatistics             | Title, title_player_account  |
|GetStatisticsForEntities  |Title |
|UpdateStatistics          |Title, title_player_account  |

## See also

- [Create basic statistics](create-basic-statistics.md).
- [Doing more with statistics](doing-more-statistics.md).
- [Seasonal statistics](seasonal-statistics.md).
- [Add contextual data to statistics](metadata-statistics.md).
- [Transactional writes](transactional-writes.md)
- [API reference](api-reference.md).
- [Statistics meters](../../pricing/meters/statistics-meters.md).