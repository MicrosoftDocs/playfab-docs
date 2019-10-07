---
author: jdeweyMSFT
title: "PartyNetwork::GetLocalUsers"
description: Gets an array containing the local users that are authenticated into the network.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyNetwork::GetLocalUsers  

Gets an array containing the local users that are authenticated into the network.  

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
  
An output value indicating the number of users provided in `localUsers`.  
  
**`localUsers`** &nbsp; [PartyLocalUserArray*](../../../typedefs.md)  
*library-allocated output array of size `*userCount`*  
  
A library-allocated output array containing the local users that are authenticated into the network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The array is backed by the library's internal memory. The array is only valid until the next call to either [AuthenticateLocalUser()](partynetwork_authenticatelocaluser.md) or [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md). The individual local user objects are valid until the local user's [PartyDestroyLocalUserCompletedStateChange](../../../structs/partydestroylocalusercompletedstatechange.md) is reported and all state changes referencing the local user object are returned via [PartyManager::FinishProcessingStateChanges()](../../PartyManager/methods/partymanager_finishprocessingstatechanges.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyNetwork::AuthenticateLocalUser](partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](partynetwork_removelocaluser.md)
  
  
