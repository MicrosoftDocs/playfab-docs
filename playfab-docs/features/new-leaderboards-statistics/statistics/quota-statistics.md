---
title: Quota Statistics
author: braulioal
description: Learn on the quota for Statistics
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---
# Quota limits statistics

The Statistic service is designed to align with PlayFab's pricing models, offering two distinct modes: 
development and live. The development mode allows titles to test each feature and begin development. 
The live mode, on the other hand, is optimized for handling larger traffic loads typical of a live game.

The following tables outlines the limits for each of these modes:

## Development Mode

| Limit | Quantity |
| --- | --- |
| Statistics Definitions | 100 definitions |
| Number of versions | 1 version |

## Live Mode


| Limit| Quantity
| --- | ---  
| Statistics Definitions | 1000 definitions 
| Number of versions | No limit 

Each paid plan has specific limits regarding reads, writes, and storage. For more detailed information, please refer to the documentation.
[PlayFab pricing page](https://playfab.com/pricing/). 


## See also

- [Create basic statistics](create-basic-statistics.md).
- [Doing more with statistics](doing-more-statistics.md).
- [Seasonal statistics](seasonal-statistics.md).
- [Limits](limits-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md).
- [Transactional writes](transactional-writes.md)
- [API reference](api-reference.md).
- [Statistics meters](../../pricing/meters/statistics-meters.md).