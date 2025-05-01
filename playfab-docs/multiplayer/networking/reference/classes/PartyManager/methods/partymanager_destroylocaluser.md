---
author: jdeweyMSFT
title: "PartyManager::DestroyLocalUser"
description: Starts an asynchronous operation to destroy a local user.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyManager::DestroyLocalUser  

Starts an asynchronous operation to destroy a local user.  

## Syntax  
  
```cpp
PartyError DestroyLocalUser(  
    const PartyLocalUser* localUser,  
    void* asyncIdentifier  
)  
```  
  
### Parameters  
  
**`localUser`** &nbsp; [PartyLocalUser*](../../PartyLocalUser/partylocaluser.md)  
  
The local user to destroy.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the operation to destroy the local user started or an error code otherwise. If this method fails, no related state changes will be generated. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous operation to destroy a local user. A [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) will be provided upon completion of the operation, indicating success or failure. Before successful completion of the operation, the local user will be removed from all networks it has authenticated into (each indicated by a [PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md)) and any local chat control associated with the user will be destroyed (indicated by a [PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)). Memory for the local user will remain valid until all state changes referencing the local user have been returned to [PartyManager::FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md)  
[PartyChatControlDestroyedStateChange](../../../structs/partychatcontroldestroyedstatechange.md)  
[PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md)  
[PartyManager::GetLocalUsers](partymanager_getlocalusers.md)
  
  
