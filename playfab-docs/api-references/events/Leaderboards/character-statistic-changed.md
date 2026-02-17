---
title: character_statistic_changed
author: joannaleecy
description: character_statistic_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# character_statistic_changed

This event is triggered when a character statistic is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|PlayerId|String||
|StatisticName|String|Name of the statistic that changed.|
|StatisticPreviousValue|int32|Old value of the statistic, before the change.|
|StatisticValue|int32|New value of the statistic, after the change.|
|TitleId|String||
|Version|uint32|Version of the statistic that changed. This is relevant for statistics that reset, since each time the statistic resets the version increments.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]