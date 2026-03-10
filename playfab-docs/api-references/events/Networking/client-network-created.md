---
title: client_network_created
author: raulalbertog
description: client_network_created event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_network_created

This event is triggered when a client network is created.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|The client-generated globally unique identifier of this instance of the Party library.|
|NetworkIdentifier|String|The network's unique identifier.|
|RegionName|String|The region name associated with the newly created network. Empty if the creation failed.|
|ServerId|String|The ServerId field from the PlayFab RequestPartyResponse.|
|VmId|String|The VmId field from the PlayFab RequestPartyResponse.|
|DurationInMs|uint32|The duration of this request in milliseconds.|
|Result|int32|The PartyStateChangeResult of the operation.|
|ResultMessage|String|A human-readable representation of the Result value.|
|ErrorDetail|uint32|The PartyError error detail code.|
|RegionCount|uint32|The count of regions specified when creating the network.|
|MaxUserCount|uint32|The maximum user count specified in the network configuration.|
|MaxDeviceCount|uint32|The maximum device count specified in the network configuration.|
|MaxUsersPerDeviceCount|uint32|The maximum users per device count specified in the network configuration.|
|MaxDevicesPerUserCount|uint32|The maximum devices per user count specified in the network configuration.|
|MaxEndpointsPerDeviceCount|uint32|The maximum endpoints per device count specified in the network configuration.|
|DirectPeerConnectivityOptions|int32|The direct peer connectivity options specified when creating the network.|
|RequestedRelayVersion|String|The requested relay protocol version.|
|RequestedRelayBuildAliasId|String|The requested relay build alias ID.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
