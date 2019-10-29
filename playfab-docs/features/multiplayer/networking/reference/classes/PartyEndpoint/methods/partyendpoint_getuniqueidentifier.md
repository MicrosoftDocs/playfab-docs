---
author: jdeweyMSFT
title: "PartyEndpoint::GetUniqueIdentifier"
description: Gets the network-unique identifier for this endpoint.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*library-allocated output*  
  
The output unique identifier.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This identifier is unique within the endpoint's network and is consistent across all endpoints in a network. It is intended to be used as a compact option for titles to refer to specific endpoints in [PartyLocalEndpoint::SendMessage()](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) data buffers without much bandwidth overhead or the need to manually negotiate identifiers. This identifier is not unique across networks. <br /><br /> This does not solve the "A talks to B about C before B sees C join" problem. See PartyManager::SynchronizeMessagesBetweenEndpoints() as a solution for this problem.   <br /><br /> For local endpoints, this method will fail until the unique identifier is assigned by the transparent cloud relay. The unique identifier will be assigned when the [PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md) for this endpoint is provided via [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md). For remote endpoints, this method will always succeed.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyEndpoint](../partyendpoint.md)  
[PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md)  
[PartyManager::StartProcessingStateChanges](../../PartyManager/methods/partymanager_startprocessingstatechanges.md)  
[PartyNetwork::FindEndpointByUniqueIdentifier](../../PartyNetwork/methods/partynetwork_findendpointbyuniqueidentifier.md)
  
  
