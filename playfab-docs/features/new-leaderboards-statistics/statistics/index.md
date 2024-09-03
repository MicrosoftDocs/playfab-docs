---
title: Azure PlayFab Statistics overview
author: braulioal
description: Learn about Azure PlayFab Statistics.
ms.author: braulioal
ms.date: 09/01/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, leaderboard, stats
ms.localizationpriority: medium
---

# Azure PlayFab Statistics overview

Azure Playfab Statistics is a cross-platform service that allows to track the activity of players within the game.

![PlayFab Stats Architecture](media/stats-relationship.png)

## Benefits

One of the main benefits of the new stats service is its cross-platform capabilities and its ability to scale
according to any requirements. In the following sections, we're going to detail a series of new features of the service.

### Multicolumn/aggregation

The Stat service now supports multiple values under a single stat definition, each with its own aggregation method,
including Max, Min, Last, and Sum.

In the following example, you can see how the stat definition could get up to a max of different columns, all of them 
having different aggregation methods. In the image on the right, you can see how an actual implementation could work for
tracking important values to a given stat.

![PlayFab Stats multicolumn](media/stat-definition.png)

### Versioning

Each statistic can now be versioned, allowing for the retention of its definition while the content is refreshed. 
This behavior is achieved through a reset strategy that can be individually defined for each statistic. Every previous version remain 
accessible for historical comparison and analysis.

In this example, we can see how the definition of the stats remains the same but the content changes between each 
version.

![PlayFab Stats versioning](media/stats-versioning.png)

### Metadata

Enhanced flexibility is introduced with the option to attach custom information to each row, providing Contextual context 
and detail that can be tailored to specific needs.

In this example, you can see how metadata is associated with each stat.

![PlayFab Stats metadata](media/stat-metadata.png)

### Standalone components

One key aspect of the Statistics service is that it can work with the Leaderboards service. This capability allows that
every time a player makes an update to their stats, it's going to be reflected into a leaderboard.
However, also this service can work in a standalone fashion if needed.

## See also

- [Quickstart stats](quickstart-statistics.md).
- [Create Basic Statistics](create-basic-statistics.md).
- [Doing More With Statistics](doing-more-statistics.md).
- [Seasonal Statistics](seasonal-statistics.md).
- [Add Contextual Data to Statistics](metadata-statistics.md).
- [API Reference](api-reference.md).
- [Ranking Players by Stats](../leaderboards/leaderboards-linked-to-stats.md).
- [Statistics Meters](../../pricing/meters/statistics-meters.md).
