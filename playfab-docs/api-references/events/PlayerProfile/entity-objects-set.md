---
title: entity_objects_set
author: joannaleecy
description: entity_objects_set event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_objects_set

This event is triggered when objects are attached to an entity.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Objects|[ObjectSet](../data-types/objectset.md)|Objects that were updated|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]