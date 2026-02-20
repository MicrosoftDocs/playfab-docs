---
title: vm_assigned
author: joannaleecy
description: vm_assigned event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# vm_assigned

This event is triggered when a virtual machine is assigned to a multiplayer server build.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[VmAssignedEventPayload](../data-types/vmassignedeventpayload.md)|The multiplayer server virtual machine assigned event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
