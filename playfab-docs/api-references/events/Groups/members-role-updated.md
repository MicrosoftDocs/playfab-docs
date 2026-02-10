---
title: members_role_updated
author: joannaleecy
description: members_role_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# members_role_updated

This event is triggered when existing group members change from one role to another.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Members|[EntityKey](../data-types/entitykey.md)[]|Entity keys of all members that were updated with the role.|
|Operation|[OperationTypes](../data-types/operationtypes.md)|The operation that was performed.|
|RoleId|String|Id of the role.|
|RoleName|String|Name of the role.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]