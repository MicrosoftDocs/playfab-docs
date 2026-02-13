---
title: player_linked_account
author: joannaleecy
description: player_linked_account event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_linked_account

This event is triggered when a new authentication method is linked to a player's account.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Email|String|Player's email linked with the given provider|
|Origination|[LoginIdentityProvider](../data-types/loginidentityprovider.md)|Authentication method being linked to a player's account.|
|OriginationUserId|String|Player's identity under authentication method being linked to player's account.|
|TitleId|String|The ID of the title to which this player event applies.|
|Username|String|Player's username linked with the given provider|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
