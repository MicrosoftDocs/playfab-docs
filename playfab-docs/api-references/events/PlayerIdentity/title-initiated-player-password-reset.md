---
title: title_initiated_player_password_reset
author: joannaleecy
description: title_initiated_player_password_reset event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_initiated_player_password_reset

This event is triggered when a title initiates the account recovery process for a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|PasswordResetId|String|Unique identifier for the password reset link. This cannot be used to complete the reset.|
|PlayerId|String|Player's account ID.|
|PlayerRecoveryEmailAddress|String|Email address to which the account recovery email was sent.|
|UserId|String||

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
