---
title: role_updated
author: joannaleecy
description: role_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# role_updated

This event is triggered when a group role is updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Operation|[OperationTypes](../data-types/operationtypes.md)|The operation that was performed.|
|PreviousRoleName|String|Previous name of the role.|
|RoleId|String|Id of the role to update.|
|RoleName|String|New name of the role.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]