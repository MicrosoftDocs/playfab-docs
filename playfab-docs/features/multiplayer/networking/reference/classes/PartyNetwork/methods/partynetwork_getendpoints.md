---
author: jdeweyMSFT
title: "PartyNetwork::GetEndpoints"
description: Gets the endpoints in this network.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyNetwork::GetEndpoints  

Gets the endpoints in this network.  

## Syntax  
  
```cpp
PartyError GetEndpoints(  
    uint32_t* endpointCount,  
    PartyEndpointArray* endpoints  
)  
```  
  
### Parameters  
  
**`endpointCount`** &nbsp; uint32_t*  
*library-allocated output*  
  
The output number of PartyEndpoint entries in the `endpoints` array.  
  
**`endpoints`** &nbsp; [PartyEndpointArray*](../../../typedefs.md)  
*library-allocated output array of size `*endpointCount`*  
  
A library-allocated output array containing the endpoints in this network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This function gets all endpoints currently associated with the network and visible to the local device. <br /><br /> All local endpoints that have successfully been created or are in the process of being created will be present in `endpoints`.   <br /><br /> Only remote endpoints that have successfully been created in the network and are visible to the local device will be present in `endpoints`.   <br /><br /> The memory for the returned array is invalidated whenever the title calls [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or [CreateEndpoint()](partynetwork_createendpoint.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md)  
[PartyNetwork::CreateEndpoint](partynetwork_createendpoint.md)  
[PartyManager::StartProcessingStateChanges](../../PartyManager/methods/partymanager_startprocessingstatechanges.md)
  
  
