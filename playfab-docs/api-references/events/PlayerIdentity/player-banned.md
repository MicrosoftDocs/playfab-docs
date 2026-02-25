---
title: player_banned
author: joannaleecy
description: player_banned event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_banned

This event is triggered when a player is banned.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BanExpiration|DateTime|When the ban expires. The value is null if the ban is permanent.|
|BanId|String|ID of the ban. Useful for tracking unique bans, if the player has been banned before.|
|BanReason|String|The reason why the player was banned.|
|PermanentBan|Boolean|Whether this ban is permanent.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
