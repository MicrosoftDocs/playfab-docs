---
title: player_registered_push_notifications
author: joannaleecy
description: player_registered_push_notifications event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_registered_push_notifications

This event is triggered when a player registers for push notifications.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeviceToken|String|Unique device token registered for push notifications.|
|Platform|[PushNotificationPlatform](../data-types/pushnotificationplatform.md)|Platform on which the player is registering for push notifications.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
