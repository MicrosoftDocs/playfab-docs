---
title: group_role_deleted
author: joannaleecy
description: group_role_deleted event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# group_role_deleted

This event is triggered when a role is deleted from a group.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeleterEntityId|String|The identifier for the entity that deleted the role to which this event applies.|
|DeleterEntityType|String|The type of entity that deleted the role to which this event applies.|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|GroupName|String|The name of the group to which this event applies.|
|RoleId|String|The role ID of the role to which this event applies.|
|RoleName|String|The display name of the role to which this event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]



