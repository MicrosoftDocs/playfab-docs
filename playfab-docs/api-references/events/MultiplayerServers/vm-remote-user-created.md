---
title: vm_remote_user_created
author: joannaleecy
description: vm_remote_user_created event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# vm_remote_user_created

This event is triggered when a multiplayer server virtual machine remote user is created.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[VmRemoteUserCreatedEventPayload](../data-types/vmremoteusercreatedeventpayload.md)|The multiplayer server virtual machine remote user created event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
