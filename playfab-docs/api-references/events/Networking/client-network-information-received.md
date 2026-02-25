---
title: client_network_information_received
author: raulalbertog
description: client_network_information_received event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_network_information_received

This event is triggered when client network information is received.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|The client-generated globally unique identifier of this instance of the Party library.|
|NetworkIdentifier|String|The network's unique identifier.|
|NetworkInformationDurationInMs|uint32|The duration of the connection operation up to the point of receiving the network information, in milliseconds.|
|TotalDurationInMs|uint32|The duration of the connection operation, receiving the network information, and all associated operations queued before it in milliseconds.|
|MaxUserCount|uint32|The maximum user count specified in the network configuration.|
|MaxDeviceCount|uint32|The maximum device count specified in the network configuration.|
|MaxUsersPerDeviceCount|uint32|The maximum users per device count specified in the network configuration.|
|MaxDevicesPerUserCount|uint32|The maximum devices per user count specified in the network configuration.|
|MaxEndpointsPerDeviceCount|uint32|The maximum endpoints per device count specified in the network configuration.|
|NetworkDirectPeerConnectivityOptions|int32|The direct peer connectivity options specified in the network configuration.|
|LocalDeviceDirectPeerConnectivityOptions|int32|The direct peer connectivity options specified by the local device when connecting to the network.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
