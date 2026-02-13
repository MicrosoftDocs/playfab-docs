---
title: player_unlinked_account
author: joannaleecy
description: player_unlinked_account event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_unlinked_account

This event is triggered when an authentication method is unlinked from a player's account.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Origination|[LoginIdentityProvider](../data-types/loginidentityprovider.md)|Authentication method being unlinked from a player's account.|
|OriginationUserId|String|Player's identity under authentication method being unlinked from player's account.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
