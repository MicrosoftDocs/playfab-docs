---
title: player_statistic_changed
author: joannaleecy
description: player_statistic_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_statistic_changed

This event is triggered when a player statistic is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AggregationMethod|[StatisticAggregationMethod](../data-types/statisticaggregationmethod.md)|Aggregation method applied for calculating the new value of the statistic.|
|StatisticId|uint32|Unique ID of the statistic that changed.|
|StatisticName|String|Name of the statistic that changed.|
|StatisticPreviousValue|int32|Old value of the statistic, before the change.|
|StatisticValue|int32|New value of the statistic, after the change.|
|TitleId|String|The ID of the title to which this player event applies.|
|Version|uint32|Version of the statistic that changed. This is relevant for statistics that reset, since each time the statistic resets the version increments.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]