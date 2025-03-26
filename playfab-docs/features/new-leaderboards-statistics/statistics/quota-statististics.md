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
# Quota limits

The Statistic service is designed to align with PlayFab's pricing models, offering two distinct modes: 
development and live. The development mode allows titles to test each feature and begin development. 
The live mode, on the other hand, is optimized for handling larger traffic loads typical of a live game.

The following table outlines the limits for each of these modes:

## Development Mode

| Limit | Quantity |
| --- | --- |
| Reads | 5 million reads |
| Writes | 1 million writes |
| Statistics Definitions | 100 definitions |
| Number of versions | 1 version |

## Live Mode
There are two paid plans, each offering different capabilities. If your title needs to exceed these limits, 
you can reach out to the PlayFab team for further assistance.

| Limit | Standard Plan |Premium Plan|
| --- | --- |--- |
| Reads |30 million reads | 500 million reads|
| Writes | 15 million writes | 250 million writes|
| Statistics Definitions | 1000 definitions | 1000 definitions
| Number of versions | No limit | No limit| 

## See also

- [Create basic statistics](create-basic-statistics.md).
- [Doing more with statistics](doing-more-statistics.md).
- [Seasonal statistics](seasonal-statistics.md).
- [Limits](limits-statistics.md)
- [Add contextual data to statistics](metadata-statistics.md).
- [Transactional writes](transactional-writes.md)
- [API reference](api-reference.md).
- [Statistics meters](../../pricing/meters/statistics-meters.md).