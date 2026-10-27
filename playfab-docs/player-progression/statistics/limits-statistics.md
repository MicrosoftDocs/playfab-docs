---
title: Limits on statistics
author: braulioal
description: Learn more about the limits on the Statistics service
ms.author: braulioal
ms.date: 06/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Limits on statistics

The Statistics service enforces API rate limits that vary based on your title's mode and configuration.

View your title's current API rate limits in Game Manager under **Settings** > **Limits** > [**API Rate Limits**](../../live-service-management/service-gateway/throttling/what-is-throttling.md#view-your-titles-api-rate-limits).

## Limits on statistics events

- `playfab.statistic.statistic_updated` doesn't work with statistics that use the entity type `master_player_account` or `external`.

## See also

- [Create basic statistics](create-basic-statistics.md)
- [Doing more with statistics](doing-more-statistics.md)
- [Seasonal statistics](seasonal-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md)
- [Transactional writes](transactional-writes.md)
- [API reference](api-reference.md)
- [Statistics meters](../../pricing/Meters/statistics-meters.md)
- [Quota](quota-statistics.md)
