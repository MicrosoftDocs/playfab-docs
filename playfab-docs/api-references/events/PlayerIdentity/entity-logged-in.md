---
title: entity_logged_in
author: joannaleecy
description: entity_logged_in event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_logged_in

This event is triggered when an entity has logged in.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]


