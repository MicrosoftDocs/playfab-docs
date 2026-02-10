---
title: group_role_created
author: joannaleecy
description: group_role_created event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# group_role_created

This event is triggered when a role is created for a group.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CreatorEntityId|String|The identifier for that the entity that created the role to which this event applies.|
|CreatorEntityType|String|The type of entity that created the role to which this event applies.|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|GroupName|String|The name of the group to which this event applies.|
|RoleId|String|The role ID of the role to which this event applies.|
|RoleName|String|The display name of the role to which this event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]




