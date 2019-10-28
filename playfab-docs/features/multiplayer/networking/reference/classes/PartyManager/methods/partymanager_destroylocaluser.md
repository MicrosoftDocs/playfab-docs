---
author: jdeweyMSFT
title: "PartyManager::DestroyLocalUser"
description: Starts an asynchronous operation to destroy a local user.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
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
  
A successful return value signifies that the asynchronous operation has started and a DestroyLocalUserCompleted state change is guaranteed to eventually be provided, via [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md), with the result of the operation. A failing return value signifies that the asynchronous operation will not execute and no completion state change will be provided. If the asynchronous operation succeeds, the local user will be removed from the list returned by [GetLocalUsers()](partymanager_getlocalusers.md) during the [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) call that provides the [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md). The user object will be destroyed upon returning the final state change referencing the user via [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md). <br /><br /> Before the asynchronous operation completes, i.e. before the PartyDestroyLocalUserCompletedStateChange is provided by [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md), the local user will be removed from all objects and networks referencing the local user. If the object depended on the user to remain in a valid state, such as with a chat control or endpoint tied to the user, or a network where the local user is the only authenticated local user, the object will be destroyed and the relevant state change will be provided prior to the DestroyLocalUserCompleted state change.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md)  
[PartyManager::GetLocalUsers](partymanager_getlocalusers.md)
  
  
