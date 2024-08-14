---
author: jdeweyMSFT
title: "PartyManager::GetLocalUsers"
description: Gets an array containing all local users created by [CreateLocalUser()](partymanager_createlocaluser.md) or [CreateLocalUserWithEntityType()](partymanager_createlocaluserwithentitytype.md).
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::GetLocalUsers  

Gets an array containing all local users created by [CreateLocalUser()](partymanager_createlocaluser.md) or [CreateLocalUserWithEntityType()](partymanager_createlocaluserwithentitytype.md).  

## Syntax  
  
```cpp
PartyError GetLocalUsers(  
    uint32_t* userCount,  
    PartyLocalUserArray* localUsers  
)  
```  
  
### Parameters  
  
**`userCount`** &nbsp; uint32_t*  
*output*  
  
The output number of local users provided in `localUsers`.  
  
**`localUsers`** &nbsp; [PartyLocalUserArray*](../../../typedefs.md)  
*library-allocated output array of size `*userCount`*  
  
A library-allocated output array containing the local users.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md), the local user will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges(), or when CreateLocalUser() or CreateLocalUserWithEntityType() returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::CreateLocalUser](partymanager_createlocaluser.md)  
[PartyManager::CreateLocalUserWithEntityType](partymanager_createlocaluserwithentitytype.md)  
[PartyManager::DestroyLocalUser](partymanager_destroylocaluser.md)  
[PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md)
  
  
