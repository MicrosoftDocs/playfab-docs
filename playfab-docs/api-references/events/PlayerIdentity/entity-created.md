---
title: entity_created
author: joannaleecy
description: entity_created event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_created

This event is triggered when an entity is created.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
