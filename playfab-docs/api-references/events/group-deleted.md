---
title: group_deleted
author: joannaleecy
description: group_deleted event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# group_deleted

This event is triggered when an entity group is deleted. 

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeleterEntityId|String|The identifier for the entity that deleted the group to which this event applies.|
|DeleterEntityType|String|The type of entity that deleted the group to which this event applies.|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](data-types/entitylineage.md)|Entities that this entity is a child of.|
|GroupName|String|The name of the group to which this event applies.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv1.md)]

