---
author: jdeweyMSFT
title: "PartyNetwork::DestroyEndpoint"
description: Queues an asynchronous attempt to destroy a local endpoint.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyNetwork::DestroyEndpoint  

Queues an asynchronous attempt to destroy a local endpoint.  

## Syntax  
  
```cpp
PartyError DestroyEndpoint(  
    PartyLocalEndpoint* localEndpoint,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localEndpoint`** &nbsp; [PartyLocalEndpoint*](../../PartyLocalEndpoint/partylocalendpoint.md)  
  
The local endpoint to begin destroying.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to destroy the endpoint began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This function queues an asynchronous attempt to destroy an endpoint associated with the local device on this network. A [PartyDestroyEndpointCompletedStateChange](../../../structs/partydestroyendpointcompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. On success, the endpoint is no longer connected to the network or visible to any devices. Memory for the endpoint will remain valid until all state changes referencing the endpoint have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md). <br /><br /> If this call returns success, asynchronous endpoint destruction has begun and methods that require network connectivity, such as [PartyLocalEndpoint::SendMessage()](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md), will fail. Methods that retrieve cached state, such as [PartyEndpoint::GetCustomContext()](../../PartyEndpoint/methods/partyendpoint_getcustomcontext.md) and [PartyEndpoint::GetEntityId()](../../PartyEndpoint/methods/partyendpoint_getentityid.md), will continue to succeed.   <br /><br /> When the local device begins destroying an endpoint, every remote device will be alerted via a [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md). Those remote devices have the opportunity to send the destructing endpoint any final messages they wish before returning the PartyEndpointDestroyedStateChange to PartyManager::FinishProcessingStateChanges(). By returning the PartyEndpointDestroyedStateChange, the remote device acknowledges the endpoint's destruction and may no longer target the endpoint in PartyLocalEndpoint::SendMessage() calls. Because the endpoint will not be able to complete its destruction on the local device until all remote devices have acknowledged it, it is recommended to return this state change as quickly as possible. If the remote device does not return the PartyEndpointDestroyedStateChange within two seconds, the remote device will automatically acknowledge the endpoint destruction and the endpoint will no longer be targetable in PartyLocalEndpoint::SendMessage() calls. The destructing endpoint can receive PartyEndpointMessageReceivedStateChanges up until all remote devices have acknowledged the endpoint's destruction, which is indicated by the local device seeing a PartyEndpointDestroyedStateChange.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyDestroyEndpointCompletedStateChange](../../../structs/partydestroyendpointcompletedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)  
[PartyEndpointMessageReceivedStateChange](../../../structs/partyendpointmessagereceivedstatechange.md)  
[PartyManager::FinishProcessingStateChanges](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md)  
[PartyLocalEndpoint::SendMessage](../../PartyLocalEndpoint/methods/partylocalendpoint_sendmessage.md)  
[PartyEndpoint::GetCustomContext](../../PartyEndpoint/methods/partyendpoint_getcustomcontext.md)  
[PartyEndpoint::GetEntityId](../../PartyEndpoint/methods/partyendpoint_getentityid.md)
  
  
