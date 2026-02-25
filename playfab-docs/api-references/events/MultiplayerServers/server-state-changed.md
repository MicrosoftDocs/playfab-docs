---
title: server_state_changed
author: joannaleecy
description: server_state_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# server_state_changed

This event is triggered when a multiplayer server's state is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|

|Payload|[ServerStateChangedEventPayload](../data-types/serverstatechangedeventpayload.md)|The multiplayer server state changed event payload.|


## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
