---
title: sent_push_notification
author: joannaleecy
description: sent_push_notification event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# sent_push_notification

This event is triggered when a push notification is sent or fails to be sent to a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Body|String|The content of the push notification body, truncated to 4096 characters.|
|ErrorMessage|String|The error that occurred if the push notification failed to be sent.|
|ErrorName|String|The name of the error that occurred if the push notification failed to be sent.|
|Language|String|The language the push notification was sent in if a matching localized template was used.|
|PushNotificationTemplateId|String|The push notification template id during a send push notification attempt.|
|PushNotificationTemplateName|String|The push notification template name during a send push notification attempt.|
|Subject|String|The content of the push notification subject, truncated to 1024 characters.|
|Success|Boolean|Indicates whether the push notification was successfully sent.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
