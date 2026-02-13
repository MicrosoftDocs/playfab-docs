---
title: player_reported_as_abusive
author: joannaleecy
description: player_reported_as_abusive event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_reported_as_abusive

This event is triggered when a player is reported by another player as abusive.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Comment|String|Comment submitted by the player who made the report.|
|ReportedByPlayer|String|Player ID of the player who made the report.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
