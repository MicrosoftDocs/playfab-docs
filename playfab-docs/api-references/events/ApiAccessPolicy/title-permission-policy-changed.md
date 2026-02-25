---
title: title_permission_policy_changed
author: joannaleecy
description: title_permission_policy_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_permission_policy_changed

This event is triggered when an update occurs to a title's permission policies.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|NewPolicy|String|The contents new policy.|
|PolicyName|String|The name of the policy that was changed|
|UserId|String||

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
