---
title: group_role_updated
author: joannaleecy
description: group_role_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# group_role_updated

This event is triggered when a role is updated within a group.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|GroupName|String|The name of the group to which this event applies.|
|NewValues|[RolePropertyValues](../data-types/rolepropertyvalues.md)|The new values of the role's changed properties|
|OldValues|[RolePropertyValues](../data-types/rolepropertyvalues.md)|The previous values of the role's changed properties|
|RoleId|String|The role ID of the role to which this event applies.|
|RoleName|String|The display name of the role to which this event applies.|
|UpdaterEntityId|String|The identifier for the entity that updated the container to which this event applies.|
|UpdaterEntityType|String|The type of entity that updated the container to which this event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]


