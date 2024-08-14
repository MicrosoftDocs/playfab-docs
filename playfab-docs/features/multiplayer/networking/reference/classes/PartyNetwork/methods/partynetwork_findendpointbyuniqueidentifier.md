---
author: jdeweyMSFT
title: "PartyNetwork::FindEndpointByUniqueIdentifier"
description: Finds the endpoint with the corresponding network-unique identifier in this network, if it exists.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::FindEndpointByUniqueIdentifier  

Finds the endpoint with the corresponding network-unique identifier in this network, if it exists.  

## Syntax  
  
```cpp
PartyError FindEndpointByUniqueIdentifier(  
    uint16_t uniqueIdentifier,  
    PartyEndpoint** endpoint  
)  
```  
  
### Parameters  
  
**`uniqueIdentifier`** &nbsp; uint16_t  
  
The network-unique identifier of an endpoint.  
  
**`endpoint`** &nbsp; [PartyEndpoint**](../../PartyEndpoint/partyendpoint.md)  
*library-allocated output*  
  
The output endpoint with a network-unique identifier matching `uniqueIdentifier`.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if an endpoint with a matching identifier was found on this network or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method returns an error if the endpoint is not valid on the local device, that is, if the [PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md) for the endpoint associated with `uniqueIdentifier` has not yet been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or if the [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md) has been generated and all state changes referencing the endpoint have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md). <br /><br /> All devices in a network will agree on a given endpoint's unique identifier, but different devices may not see the same endpoints at a given moment. For example, it's possible for endpoint A to send a message to endpoint B that references a newly-created endpoint C's unique identifier, but that message between A and B may arrive before the PartyEndpointCreatedStateChange for endpoint C is generated on endpoint B's device. In that situation, this method will return an error when called on endpoint B's device because endpoint C is not yet known on that device.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyEndpoint::GetUniqueIdentifier](../../PartyEndpoint/methods/partyendpoint_getuniqueidentifier.md)  
[PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)
  
  
