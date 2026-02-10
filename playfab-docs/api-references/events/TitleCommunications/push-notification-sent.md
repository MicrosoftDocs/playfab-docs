---
title: push_notification_sent
author: joannaleecy
description: push_notification_sent event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# push_notification_sent

This event is triggered when a push notification is sent to a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ErrorMessage|String|The error that occurred if failed.|
|PushNotificationTemplateId|String|The push notification template id.|
|PushNotificationTemplateName|String|The friendly name of the push notification template.|
|Success|Boolean|Whether the push notification was sent successfully.|

## Common Properties

[!INCLUDE [playstream-events-common-properties-v2](../../../includes/_common-properties-eventsv2.md)]
