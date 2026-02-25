---
title: sent_email
author: ronnyparedes
description: sent_email event.
ms.author: ronnyparedes
ms.date: 02/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# sent_email

This event is triggered when an email is sent or fails to send to a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Body|String|The content of the email body, truncated to 4096 characters.|
|EmailName|String|The name of the player's contact email the email was sent to.|
|EmailTemplateId|String|The email template id during a send email attempt.|
|EmailTemplateName|String|The email template name during a send email attempt.|
|EmailTemplateType|[EmailTemplateType](../data-types/emailtemplatetype.md)|The email template type during a send email attempt.|
|ErrorMessage|String|The error that occurred if an email failed to send.|
|ErrorName|String|The name of the error that occurred if an email failed to send.|
|Language|String|The language the email was sent in|
|Subject|String|The content of the email subject, truncated to 1024 characters.|
|Success|Boolean|Indicates if the email was successfully sent.|
|TitleId|String|The ID of the title to which this player event applies.|
|Token|String|The auth token included in the sent email as part of a confirmation URL.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
