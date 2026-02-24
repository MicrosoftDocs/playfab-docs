---
title: email_sent
author: ronnyparedes
description: email_sent event.
ms.author: ronnyparedes
ms.date: 02/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# email_sent

This event is triggered when an email is sent to a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EmailName|String|The name of the player's contact email.|
|EmailTemplateId|String|The email template id.|
|EmailTemplateName|String|The friendly name of the Template.|
|ErrorMessage|String|The error that occurred if failed.|
|Succeeded|Boolean|Whether the email was sent successfully.|

## Common Properties

[!INCLUDE [playstream-events-common-properties-v2](../../../includes/_common-properties-eventsv2.md)]
