---
title: player_completed_password_reset
author: joannaleecy
description: player_completed_password_reset event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_completed_password_reset

This event is triggered when a player completes the password reset process by visiting the link URL that was sent to them and choosing a new password.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CompletedFromIPAddress|String|IP address from which the password reset process was completed.|
|CompletionTimestamp|DateTime|When the password reset process was completed.|
|InitiatedBy|[PasswordResetInitiationSource](../data-types/passwordresetinitiationsource.md)|Source that initiated the password reset process.|
|InitiatedFromIPAddress|String|IP address from which the password reset process was initiated.|
|InitiationTimestamp|DateTime|When the password reset process was initiated.|
|LinkExpiration|DateTime|Expiration time for the password reset link.|
|PasswordResetId|String|Unique identifier for the password reset link. This cannot be used to complete the reset.|
|RecoveryEmailAddress|String|Email address to which the password reset link was sent.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
