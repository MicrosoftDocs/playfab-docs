---
title: title_secret_key_changed
author: joannaleecy
description: title_secret_key_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_secret_key_changed

This event is triggered when a title adds or updates a Secret Key

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Deleted|Boolean|Flag indicating if the key was deleted by this operation. Either true or null.|
|DeveloperId|String||
|Disabled|Boolean|Flag indicating if the key is disabled|
|ExpiryDate|DateTime|Optional UTC date time that the secret key will expire at.|
|SecretKeyId|String|Id of the secret key affected.|
|SecretKeyName|String|Name of the secret key affected.|
|UserId|String||

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
