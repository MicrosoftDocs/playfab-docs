---
author: jdeweyMSFT
title: "PartyNetwork::RemoveLocalUser"
description: Queues an asynchronous operation to remove a local user from the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyNetwork::RemoveLocalUser  

Queues an asynchronous operation to remove a local user from the network.  

## Syntax  
  
```cpp
PartyError RemoveLocalUser(  
    const PartyLocalUser* localUser,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user to remove from the network.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the asynchronous operation to remove the local user began, or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Upon completion of the asynchronous operation, a user is no longer considered authenticated into the network. Completion is indicated by a [PartyRemoveLocalUserCompletedStateChange](../../../structs/partyremovelocalusercompletedstatechange.md). The asynchronous operation will always succeed, and a [PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md) will always be provided before the PartyRemoveLocalUserCompletedStateChange. Before successful completion of the operation, all endpoints associated with that user will be destroyed (each indicated by a [PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)) and all chat controls associated with that user will be disconnected from the network (each indicated by a [PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)). <br /><br /> When all local users are removed from the network, the device is no longer considered authenticated. All endpoints are destroyed and all remote devices will appear to leave the network, because they're no longer visible to the local device. Similarly, all remote devices will see the local device as having left the network. The device won't immediately be disconnected and can again be authenticated by a new call to [AuthenticateLocalUser()](partynetwork_authenticatelocaluser.md). However, because being connected to a network with no authenticated users isn't a useful state outside of transition periods, the Party library will automatically disconnect a device that is unauthenticated for more than one minute.   <br /><br /> This method fails if the specified `localUser` is already in the process of being removed from the network due to a previous call to this method.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyRemoveLocalUserCompletedStateChange](../../../structs/partyremovelocalusercompletedstatechange.md)  
[PartyEndpointDestroyedStateChange](../../../structs/partyendpointdestroyedstatechange.md)  
[PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)  
[PartyNetwork::AuthenticateLocalUser](partynetwork_authenticatelocaluser.md)  
[PartyNetwork::GetLocalUsers](partynetwork_getlocalusers.md)
  
  
