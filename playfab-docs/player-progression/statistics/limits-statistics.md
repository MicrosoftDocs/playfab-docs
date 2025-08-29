---
title: Limits on statistics
author: braulioal
description: Learn more about the limits on the Statistics service
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---
# Limits on statistics

The purpose of this guide is to detail the limits that are enforced when creating, updating, and reading from your statistics on the Statistic service.

- Caller: This type of limit is enforced on the caller of the API. This constraint could be either a player or a title.
- Target: This type of limit is enforced on the target of the API, in our specific case an entity.

The following table defines the limits for the various APIs available in the Statistics service. If an API isn't explicitly listed here, the default behavior is going to be applied.

| API | Limit | Caller | Target entity |
| --- | --- | --- | --- |
| Default | 50 requests per 120 seconds | Player | `title_player_account`, `master_player_account` , `group`, `character` |
| GetStatistics | 30 requests per 120 seconds / 1,200 requests per 120 seconds  | Player / Title | `title_player_account`, `master_player_account` , `group`, `character` |
| UpdateStatistics | 30 requests per 120 seconds  | Title/Player  | `title_player_account`, `master_player_account` , `group`, `character` |
| DeleteStatistics | 30 requests per 120 seconds  | Title  | `title_player_account` , `master_player_account` , `group`, `character` |
| CreateStatisticDefinition | 30 requests per 120 seconds  | Title  | N/A |
| GetStatisticDefinition | 30 requests per 120 seconds  | Title  |  N/A |
| ListStatisticDefinitions | 30 requests per 120 seconds  | Title  |  N/A |
| DeleteStatisticsDefinition | 30 requests per 120 seconds  | Title  |  N/A |
| IncrementStatisticVersion | 30 requests per 120 seconds  | Title  |  N/A |

## Limit on statistics events

- `playfab.statistic.statistic_updated`, will not work with statistics that use the entity type `master_player_account` or `external`

## See also

- [Create basic statistics](create-basic-statistics.md)
- [Doing more with statistics](doing-more-statistics.md)
- [Seasonal statistics](seasonal-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md)
- [Transactional writes](transactional-writes.md)
- [API reference](api-reference.md)
- [Statistics meters](../../pricing/meters/statistics-meters.md)
- [Quota](quota-statistics.md)
