---
title: auth_token_validated
author: joannaleecy
description: auth_token_validated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# auth_token_validated

This event is triggered when an email confirmation link is clicked.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EmailTemplateId|String|The email template id, if the auth token was sent via an email template.|
|TitleId|String|The ID of the title to which this player event applies.|
|Token|String|The email token in the confirmation link that was clicked.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
