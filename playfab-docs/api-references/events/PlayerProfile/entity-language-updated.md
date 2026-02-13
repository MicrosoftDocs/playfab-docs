---
title: entity_language_updated
author: joannaleecy
description: entity_language_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_language_updated

This event is triggered when the language associated with an entity is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Language|String|Language that was updated|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]

