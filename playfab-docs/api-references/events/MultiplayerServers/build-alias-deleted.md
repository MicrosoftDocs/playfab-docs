---
title: build_alias_deleted
author: valexao
description: build_alias_deleted event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# build_alias_deleted 

This event is triggered when a multiplayer server build alias is deleted.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[BuildAliasDeletedEventPayload](../data-types/buildaliasdeletedeventpayload.md)|The multiplayer server build alias deleted event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
