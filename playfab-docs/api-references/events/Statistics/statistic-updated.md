---
title: statistic_updated
author: t-sandersg-gith
description: statistic_updated event
ms.author: t-sandersg
ms.date: 8/18/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# statistic_updated

This event is triggered when a statistic is updated for a given entity.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| Name | String | The name of the statistic |
| Version | int32 | The version of the statistic |
| Scores | int64[] | The current scores for the statistic, after the change |
| PreviousScores | int64[] | The previous scores for the statistic, before the change |
| Metadata | String | The metadata associated with the statistic, after the change |
| PreviousMetadata | String | The metadata associated with the statistic, before the change |
| Operation | String | The operation that was performed: `Created`, `Updated`, or `Deleted` |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
