---
author: jdeweyMSFT
title: "PartyEndpoint::GetUniqueIdentifier"
description: Gets the network-unique identifier for this endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyEndpoint::GetUniqueIdentifier  

Gets the network-unique identifier for this endpoint.  

## Syntax  
  
```cpp
PartyError GetUniqueIdentifier(  
    uint16_t* uniqueIdentifier  
)  
```  
  
### Parameters  
  
**`uniqueIdentifier`** &nbsp; uint16_t*  
*output*  
  
The output unique identifier.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This identifier is unique within the endpoint's network and is consistent across all endpoints in a network. It is intended to be used as a compact option for titles to refer to specific endpoints in [PartyLocalEndpoint::SendMessage()](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) data buffers without much bandwidth overhead or the need to manually negotiate identifiers. This identifier is not unique across networks. <br /><br /> For local endpoints, this method will fail until the [PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md). For remote endpoints, this method will always succeed.   <br /><br /> All devices in a network will agree on a given endpoint's unique identifier, but different devices may not see the same endpoints at a given moment. For example, it's possible for endpoint A to send a message to endpoint B that references a newly-created endpoint C's unique identifier, but that message between A and B may arrive before the PartyEndpointCreatedStateChange for endpoint C is generated on endpoint B's device.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  
[PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md)  
[PartyNetwork::FindEndpointByUniqueIdentifier](../../PartyNetwork/methods/partynetwork_findendpointbyuniqueidentifier.md)
  
  
