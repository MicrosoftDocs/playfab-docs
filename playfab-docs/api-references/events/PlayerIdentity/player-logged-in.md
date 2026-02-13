---
title: player_logged_in
author: joannaleecy
description: player_logged_in event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_logged_in

This event is triggered when a player logs in.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Location|[EventLocation](../data-types/eventlocation.md)|Player's geographic location, if known. Location is estimated from factors such as IP address and is not always available or accurate.|
|Platform|[LoginIdentityProvider](../data-types/loginidentityprovider.md)|Authentication method used to login the player.|
|PlatformUserId|String|Player's identity under the authentication method used to login the player.|
|PlatformUserName|String|The display name that's set in the identity provider that the player is authenticated with.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
