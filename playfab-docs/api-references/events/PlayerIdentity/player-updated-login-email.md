---
title: player_updated_login_email
author: ronnyparedes
description: player_updated_login_email event.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_updated_login_email

This event is triggered when a player's login email is updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|NewEmailAddress|String|The login email updated in the player's profile.|
|PreviousEmailAddress|String|The previous login email updated in the player's profile.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
