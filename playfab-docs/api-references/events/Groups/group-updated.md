---
title: group_updated
author: joannaleecy
description: group_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# group_updated

This event is triggered when an entity group is updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|GroupName|String|The name of the group to which this event applies.|
|NewValues|[GroupPropertyValues](../data-types/grouppropertyvalues.md)|The new values of the group's changed properties|
|OldValues|[GroupPropertyValues](../data-types/grouppropertyvalues.md)|The previous values of the group's changed properties|
|UpdaterEntityId|String|The identifier for the entity that updated the group to which this event applies.|
|UpdaterEntityType|String|The type of entity that updated the group to which this event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]


