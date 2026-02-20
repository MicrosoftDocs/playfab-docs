---
title: secret_deleted
author: valexao
description: secret_deleted event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# secret_deleted

This event is triggered when a multiplayer server secret is deleted.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[SecretDeletedEventPayload](../data-types/secretdeletedeventpayload.md)|The multiplayer server secret deleted event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]

