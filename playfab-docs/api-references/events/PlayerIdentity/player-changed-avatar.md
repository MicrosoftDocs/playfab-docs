---
title: player_changed_avatar
author: joannaleecy
description: player_changed_avatar event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_changed_avatar

This event is triggered when a player's avatar URL is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ImageUrl|String|URL of the avatar image.|
|PreviousImageUrl|String|Previous URL of the avatar image.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
