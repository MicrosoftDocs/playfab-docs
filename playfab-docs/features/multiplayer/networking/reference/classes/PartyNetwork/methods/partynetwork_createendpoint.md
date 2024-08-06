---
author: jdeweyMSFT
title: "PartyNetwork::CreateEndpoint"
description: Queues an asynchronous attempt to create a local endpoint.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/20/2023
---

# PartyNetwork::CreateEndpoint  

Queues an asynchronous attempt to create a local endpoint.  

## Syntax  
  
```cpp
PartyError CreateEndpoint(  
    const PartyLocalUser* localUser,  
    uint32_t propertyCount,  
    const PartyString* keys,  
    const PartyDataBuffer* values,  
    void* asyncIdentifier,  
    PartyLocalEndpoint** localEndpoint  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
*optional*  
  
An optional local user to associate as the owner of this endpoint. When this endpoint becomes visible on remote devices, the user's identifier is tied to this endpoint. The endpoint will be destroyed if the user becomes unauthenticated because they were voluntarily removed via [RemoveLocalUser()](partynetwork_removelocaluser.md) or kicked via PartyNetwork::KickUser().  
  
**`propertyCount`** &nbsp; uint32_t  
  
The number of properties in the input `keys` and `values` arrays.  
  
**`keys`** &nbsp; [PartyString*](../../../typedefs.md)  
*optional input array of size `propertyCount`*  
  
The `propertyCount` entry array of property bag keys. The nth key in this array maps to the nth value in the `values` array. This parameter must be nullptr if `propertyCount` is 0.  
  
**`values`** &nbsp; [PartyDataBuffer*](../../../structs/partydatabuffer.md)  
*optional input array of size `propertyCount`*  
  
The `propertyCount` entry array of property bag values. The nth value in this array is mapped by the nth key in the `keys` array. This parameter must be nullptr if `propertyCount` is 0.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`localEndpoint`** &nbsp; [PartyLocalEndpoint**](../../PartyLocalEndpoint/partylocalendpoint.md)  
*optional, library-allocated output*  
  
The optional, output local endpoint object on which to queue endpoint operations.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to create the endpoint began, or an error code otherwise. If this method fails, no related state changes are generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous attempt to create an endpoint associated with the local device on this network. A [PartyCreateEndpointCompletedStateChange](../../../structs/partycreateendpointcompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. On success, a [PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md) will be generated, and the endpoint will be fully created, connected to the network, and visible to all authenticated devices in the network. On failure, a [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md) will be generated. <br /><br /> This method optionally provides `localEndpoint` as output that can immediately be used to perform asynchronous endpoint operations, such as [PartyLocalEndpoint::SendMessage()](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md) and PartyLocalEndpoint::SetSharedProperties(). These asynchronous operations are internally queued until the endpoint creation completes, at which point they will be processed. [PartyEndpoint::GetUniqueIdentifier()](../../PartyEndpoint/methods/partyendpoint_getuniqueidentifier.md) returns a failure until the endpoint creation completes. This `localEndpoint` will also be provided in the resulting PartyCreateEndpointCompletedStateChange.   <br /><br /> A local user may optionally be provided as the owner of an endpoint. If an owning local user is provided, it must be authenticated into the network or in the process of authenticating into the network. If its authentication fails, the endpoint creation will fail as well. If the owning local user is removed from the network while this endpoint exists, the endpoint will be automatically destroyed. This will be signaled via a PartyEndpointDestroyedStateChange.   <br /><br /> If the local device enters a state in which there are no authenticated users and no authentication operations in progress, then all endpoints, including those that are not fully created, are destroyed automatically. This will be signaled by PartyEndpointDestroyedStateChanges.   <br /><br /> On successful return, this method invalidates the memory for any array previously returned by [GetEndpoints()](partynetwork_getendpoints.md), as it synchronously adds the new endpoint to the array. [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) also invalidates the memory for the array. The returned `localEndpoint` object remains valid until a PartyEndpointDestroyedStateChange has been generated and all state changes referencing the object have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).   <br /><br /> The property bag is a collection of title-specific values associated with an endpoint. The initial property bag is queryable as soon as the endpoint becomes visible.   <br /><br /> If a client would violate the [PartyNetworkConfiguration::maxEndpointsPerDeviceCount](../../../structs/partynetworkconfiguration.md) limit by calling this method after the network configuration was made available, this operation fails synchronously. If the client queues a violating number of endpoint creations before the network configuration becomes available, the client will be kicked from the network and a [PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md) will be generated when the network configuration becomes available.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyCreateEndpointCompletedStateChange](../../../structs/partycreateendpointcompletedstatechange.md)  
[PartyEndpointCreatedStateChange](../../../structs/partyendpointcreatedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)  
[PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md)  
[PartyNetworkConfiguration](../../../structs/partynetworkconfiguration.md)  
[PartyNetwork::GetEndpoints](partynetwork_getendpoints.md)  
[PartyLocalEndpoint::SendMessage](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)  
[PartyEndpoint::GetUniqueIdentifier](../../PartyEndpoint/methods/partyendpoint_getuniqueidentifier.md)  
[PartyEndpoint::GetEntityId](../../PartyEndpoint/methods/partyendpoint_getentityid.md)  
[PartyEndpoint::GetSharedProperty](../../PartyEndpoint/methods/partyendpoint_getsharedproperty.md)  
[PartyNetwork::AuthenticateLocalUser](partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](partynetwork_removelocaluser.md)
  
  
