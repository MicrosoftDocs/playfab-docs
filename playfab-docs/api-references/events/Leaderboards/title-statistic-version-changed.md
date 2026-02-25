---
title: title_statistic_version_changed
author: joannaleecy
description: title_statistic_version_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_statistic_version_changed

This event is triggered when the version of a statistic changes, causing its leaderboard to reset.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ScheduledResetInterval|[StatisticResetIntervalOption](../data-types/statisticresetintervaloption.md)|The interval on which the statistic leaderboard was configured to reset, if any.|
|ScheduledResetTime|DateTime|The time at which the statistic leaderboard was configured to reset, if any.|
|StatisticName|String|Unique name of the statistic.|
|StatisticVersion|uint32|Version of the statistic, following the update.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]