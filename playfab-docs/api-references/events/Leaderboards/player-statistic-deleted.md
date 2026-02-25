---
title: player_statistic_deleted
author: joannaleecy
description: player_statistic_deleted event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_statistic_deleted

This event is triggered when a player statistic is deleted.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|StatisticId|uint32|Unique ID of the statistic that was deleted.|
|StatisticName|String|Name of the statistic that was deleted.|
|StatisticPreviousValue|int32|Old value of the statistic, before being deleted.|
|TitleId|String|The ID of the title to which this player event applies.|
|Version|uint32|Version of the statistic. This is relevant for statistics that reset, since each time the statistic resets the version increments.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
