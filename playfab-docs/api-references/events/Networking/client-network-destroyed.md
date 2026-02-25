---
title: client_network_destroyed
author: raulalbertog
description: client_network_destroyed event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_network_destroyed

This event is triggered when a client network is destroyed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|The client-generated globally unique identifier of this instance of the Party library.|
|NetworkIdentifier|String|The network's unique identifier at the time it was destroyed.|
|RegionName|String|The region name associated with the underlying relay for the network.|
|HostName|String|The relay's hostname.|
|Port|uint16|The relay's port.|
|LocalConnectionId|uint32|A local identifier to disambiguate multiple connections to the same network from a single client.|
|Reason|int32|The PartyDestroyedReason that the network was destroyed.|
|ReasonMessage|String|A human-readable representation of the Reason value.|
|ErrorDetail|uint32|The PartyError error detail code.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
