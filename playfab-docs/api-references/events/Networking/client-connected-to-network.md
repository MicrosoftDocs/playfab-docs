---
title: client_connected_to_network
author: raulalbertog
description: client_connected_to_network event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_connected_to_network

This event is triggered when a client connects to a network.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|The client-generated globally unique identifier of this instance of the Party library.|
|NetworkIdentifier|String|The network's unique identifier.|
|RegionName|String|The region name associated with the underlying relay for the network.|
|HostName|String|The hostname of the relay the client is connecting to.|
|Port|uint16|The port the client is connecting to.|
|ConnectDurationInMs|uint32|The duration of the isolated connection operation in milliseconds.|
|TotalDurationInMs|uint32|The duration of the connection operation and all associated operations queued before it in milliseconds.|
|LocalConnectionId|uint32|A local identifier to disambiguate multiple connections to the same network from a single client.|
|Result|int32|The PartyStateChangeResult of the operation.|
|ResultMessage|String|A human-readable representation of the Result value.|
|ErrorDetail|uint32|The PartyError error detail code.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
