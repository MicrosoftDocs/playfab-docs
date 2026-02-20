---
title: vm_unhealthy
author: joannaleecy
description: vm_unhealthy event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# vm_unhealthy
This event is triggered when a virtual machine is found to be unhealthy.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[VmUnhealthyEventPayload](../data-types/vmunhealthyeventpayload.md)|The multiplayer server virtual machine unhealthy event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]