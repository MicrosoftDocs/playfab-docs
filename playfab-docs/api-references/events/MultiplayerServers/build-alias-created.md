---
title: build_alias_created
author: valexao
description: build_alias_created event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# build_alias_created 

This event is triggered when a multiplayer server build alias is created.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[BuildAliasCreatedEventPayload](../data-types/buildaliascreatedeventpayload.md)|The multiplayer server build alias created event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
