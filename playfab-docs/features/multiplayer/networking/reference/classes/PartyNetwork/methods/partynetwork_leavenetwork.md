---
author: jdeweyMSFT
title: "PartyNetwork::LeaveNetwork"
description: Queues an asynchronous operation to leave the network gracefully.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::LeaveNetwork  

Queues an asynchronous operation to leave the network gracefully.  

## Syntax  
  
```cpp
PartyError LeaveNetwork(  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to leave the network began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous operation to gracefully leave the network. A [PartyLeaveNetworkCompletedStateChange](../../../structs/partyleavenetworkcompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. Memory for the network will remain valid until all state changes referencing the network have been returned to [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md). <br /><br /> Before successful completion of the operation, all in-flight inbound and outbound traffic to and from all local endpoints on this device will be delivered, state changes will be generated on this device showing all local and remote endpoints being destroyed (each indicated by a [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)), all chat controls being disconneced from this network (each indicated by a [PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)), all remote devices leaving the network (each indicated by a [PartyRemoteDeviceLeftNetworkStateChange](../../../structs/partyremotedeviceleftnetworkstatechange.md)), and all local users being removed from this network (each indicated by a [PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md)).   <br /><br /> This object will be valid until a [PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md) has been generated and all state changes referencing the object have been returned to PartyManager::FinishProcessingStateChanges().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)  
[PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)  
[PartyRemoteDeviceLeftNetworkStateChange](../../../structs/partyremotedeviceleftnetworkstatechange.md)  
[PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md)
  
  
