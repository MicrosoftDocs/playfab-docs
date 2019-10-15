---
author: jdeweyMSFT
title: "PartyManager::GetLocalUsers"
description: Gets an array containing all local users created by CreateLocalUser().
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyManager::GetLocalUsers  

Gets an array containing all local users created by CreateLocalUser().  

## Syntax  
  
```cpp
PartyError GetLocalUsers(  
    uint32_t* userCount,  
    PartyLocalUserArray* localUsers  
)  
```  
  
### Parameters  
  
**`userCount`** &nbsp; uint32_t*  
*library-allocated output*  
  
The output number of local users provided in `localUsers`.  
  
**`localUsers`** &nbsp; [PartyLocalUserArray*](../../../typedefs.md)  
*library-allocated output array of size `*userCount`*  
  
A library-allocated output array containing the local users.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
The array is backed by the library's internal memory. The array is only valid until the next call to either [CreateLocalUser()](partymanager_createlocaluser.md) or [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md). The individual local user objects are valid until the local user's [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) is reported and all state changes referencing the local user object are returned via [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::CreateLocalUser](partymanager_createlocaluser.md)  
[PartyManager::DestroyLocalUser](partymanager_destroylocaluser.md)  
[PartyManager::StartProcessingStateChanges](partymanager_startprocessingstatechanges.md)  
[PartyManager::FinishProcessingStateChanges](partymanager_finishprocessingstatechanges.md)
  
  
