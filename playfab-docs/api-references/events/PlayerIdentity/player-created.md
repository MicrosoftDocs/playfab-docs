---
title: player_created
author: joannaleecy
description: player_created event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_created

This event is triggered when a player account is created for the first time. Note: this event is only triggered once per publisher, not once per title.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Created|DateTime|When the player account was created.|
|PublisherId|String|Unique ID for the publisher account under which this player account is created.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
