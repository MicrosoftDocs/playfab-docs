---
title: vm_state_change
author: valexao
description: vm_state_change event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# vm_state_change

This event is triggered when a multiplayer virtual machine's state is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[VmStateChangeEventPayload](../data-types/vmstatechangeeventpayload.md)|The multiplayer server vm state change event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]

