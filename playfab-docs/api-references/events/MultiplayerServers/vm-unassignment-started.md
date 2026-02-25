---
title: vm_unassignment_started
author: joannaleecy
description: vm_unassignment_started event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# vm_unassignment_started
This event is triggered when a virtual machine is unassigned from a multiplayer server build.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[VmUnassignmentStartedEventPayload](../data-types/vmunassignmentstartedeventpayload.md)|The multiplayer server virtual machine unassignment started event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
