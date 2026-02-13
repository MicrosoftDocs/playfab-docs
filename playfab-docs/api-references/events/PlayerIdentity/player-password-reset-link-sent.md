---
title: player_password_reset_link_sent
author: joannaleecy
description: player_password_reset_link_sent event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_password_reset_link_sent

This event is triggered when a player is sent a link to reset their password.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|InitiatedBy|[PasswordResetInitiationSource](../data-types/passwordresetinitiationsource.md)|Source that initiated the password reset process.|
|InitiatedFromIPAddress|String|IP address from which the password reset process was initiated.|
|LinkExpiration|DateTime|Expiration time for the password reset link.|
|PasswordResetId|String|Unique identifier for the password reset link. This cannot be used to complete the reset.|
|RecoveryEmailAddress|String|Email address to which the password reset link was sent.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
