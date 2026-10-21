---
title: Quota Statistics
author: braulioal
description: Learn on the quota for Statistics
ms.author: braulioal
ms.date: 06/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---
# Quota Statistics

The Statistic service has quotas that vary based on your title's mode and configuration. View your title's current quota in Game Manager under **Settings** > **Limits**.

## Design considerations

The following limits apply regardless of title mode and affect how you design your statistics:

| Limit | Value |
| --- | --- |
| Maximum columns per statistic definition | 5 |
| Maximum metadata length per entry | 50 UTF-8 characters |


## See also

- [Create basic statistics](create-basic-statistics.md)
- [Doing more with statistics](doing-more-statistics.md)
- [Seasonal statistics](seasonal-statistics.md)
- [Limits](limits-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md)
- [Transactional writes](transactional-writes.md)
- [API reference](api-reference.md)
- [Statistics meters](../../pricing/Meters/statistics-meters.md)