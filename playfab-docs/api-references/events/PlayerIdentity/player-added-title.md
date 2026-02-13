---
title: player_added_title
author: joannaleecy
description: player_added_title event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_added_title

This event is triggered when a player creates a new account for a title. Note: this event is triggered once per title rather than once per publisher.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DisplayName|String|Player's display name when they added this title.|
|Platform|[LoginIdentityProvider](../data-types/loginidentityprovider.md)|Authentication method used to register player's account.|
|PlatformUserId|String|Unique ID for the player's account associated with the Origination authentication method.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
