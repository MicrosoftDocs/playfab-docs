---
title: player_ad_activity_valued
author: joannaleecy
description: player_ad_activity_valued event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_ad_activity_valued

Event triggered when reported value of ad view is recorded

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AdPlacementId|String|Id of the placement|
|AdPlacementName|String|Name of the placement|
|AdUnit|String|Ad unit type|
|RevenueShare|double|Share of the revenue for this ad view (calculated as total revenue for placement divided by total views for that placement in that time window)|
|RewardId|String|Id of the reward|
|RewardName|String|Name of the reward|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv1.md)]
