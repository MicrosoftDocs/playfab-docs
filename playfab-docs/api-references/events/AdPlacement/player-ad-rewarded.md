---
title: player_ad_rewarded
author: joannaleecy
description: player_ad_rewarded event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_ad_rewarded

This event is triggered when a player recieves an ad reward.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ActionGroupDebugMessages|[]|Debug messages from the reward actions|
|AdPlacementId|String|Id of the placement|
|AdPlacementName|String|Name of the placement|
|AdUnit|String|Ad unit type|
|RewardId|String|Id of the reward|
|RewardName|String|Name of the reward|
|TitleId|String|The ID of the title to which this player event applies.|
|ViewsRemainingThisPeriod|int32|Views this player has remaining for the placement's window, if applicable|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
