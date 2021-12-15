---
author: jdeweyMSFT
title: "PartyNetwork::GetLocalUsers"
description: Gets an array containing the local users that are authenticated or authenticating into the network.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetLocalUsers  

Gets an array containing the local users that are authenticated or authenticating into the network.  

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
  
An output value indicating the number of users provided in `localUsers`.  
  
**`localUsers`** &nbsp; [PartyLocalUserArray*](../../../typedefs.md)  
*library-allocated output array of size `*userCount`*  
  
A library-allocated output array containing the local users that are authenticated or authenticating into the network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md), the local user will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges() or [AuthenticateLocalUser()](partynetwork_authenticatelocaluser.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyNetwork::AuthenticateLocalUser](partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](partynetwork_removelocaluser.md)  
[PartyLocalUserRemovedStateChange](../../../structs/partylocaluserremovedstatechange.md)
  
  
