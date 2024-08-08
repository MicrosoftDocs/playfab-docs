---
author: jdeweyMSFT
title: "PartyNetwork::GetEndpointsByUserType"
description: Gets a subset of endpoints in this network filtered by user type and owning device location.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyNetwork::GetEndpointsByUserType  

Gets a subset of endpoints in this network filtered by user type and owning device location.  

## Syntax  
  
```cpp
PartyError GetEndpointsByUserType(  
    PartyEndpointUserTypeFilter endpointUserTypeFilter,  
    PartyEndpointLocationFilter endpointLocationFilter,  
    uint32_t* endpointCount,  
    PartyEndpointArray* endpoints  
)  
```  
  
### Parameters  
  
**`endpointUserTypeFilter`** &nbsp; [PartyEndpointUserTypeFilter](../../../enums/partyendpointusertypefilter.md)  
  
The specific type of users whose PartyEndpoints should be included in the output array.  
  
**`endpointLocationFilter`** &nbsp; [PartyEndpointLocationFilter](../../../enums/partyendpointlocationfilter.md)  
  
Specifies whether to include PartyEndpoints created by the local device, remote devices, or both in the output array.  
  
**`endpointCount`** &nbsp; uint32_t*  
*output*  
  
The output number of PartyEndpoint entries in the `endpoints` array.  
  
**`endpoints`** &nbsp; [PartyEndpointArray*](../../../typedefs.md)  
*library-allocated output array of size `*endpointCount`*  
  
A library-allocated output array containing the endpoints in this network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method gets the subset of endpoints that are currently associated with the network, visible to the local device, and that match specified user type and owning device location filters. <br /><br /> If `endpointLocationFilter` is PartyEndpointLocationFilter::LocalOrRemote or PartyEndpointLocationFilter::LocalOnly, then all matching local endpoints that have successfully been created or are in the process of being created will be present in `endpoints`. If `endpointLocationFilter` is PartyEndpointLocationFilter::LocalOrRemote or PartyEndpointLocationFilter::RemoteOnly, then all matching remote endpoints that have been successfully created will be present.   <br /><br /> Once a [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md), the endpoint will no longer be present in the array returned by this method with applicable filters.   <br /><br /> The memory for the returned array is invalidated whenever the title calls [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or [CreateEndpoint()](partynetwork_createendpoint.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyEndpointUserTypeFilter](../../../enums/partyendpointusertypefilter.md)  
[PartyEndpointLocationFilter](../../../enums/partyendpointlocationfilter.md)  
[PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)  
[PartyNetwork::CreateEndpoint](partynetwork_createendpoint.md)  
[PartyNetwork::GetEndpoints](partynetwork_getendpoints.md)
  
  
