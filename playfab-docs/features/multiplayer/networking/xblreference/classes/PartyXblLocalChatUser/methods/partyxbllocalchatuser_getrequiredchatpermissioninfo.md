---
author: alexatxbox
title: "PartyXblLocalChatUser::GetRequiredChatPermissionInfo"
description: Gets the cached required chat permission information related to a target chat user.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblLocalChatUser::GetRequiredChatPermissionInfo  

Gets the cached required chat permission information related to a target chat user.  

## Syntax  
  
```cpp
PartyError GetRequiredChatPermissionInfo(  
    const PartyXblChatUser* targetChatUser,  
    PartyXblChatPermissionInfo* chatPermissionInfo  
)  
```  
  
### Parameters  
  
**`targetChatUser`** &nbsp; [PartyXblChatUser*](../../PartyXblChatUser/partyxblchatuser.md)  
  
The chat user for which permissions relative to the local chat user should be retrieved.  
  
**`chatPermissionInfo`** &nbsp; [PartyXblChatPermissionInfo*](../../../structs/partyxblchatpermissioninfo.md)  
*library-allocated output*  
  
The output chat permission info object. The chat permission info object contains the most permissive chat permission possible while still respecting Xbox Live requirements.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblLocalChatUser](../partyxbllocalchatuser.md)  
[PartyXblCreateLocalChatUserCompletedStateChange](../../../structs/partyxblcreatelocalchatusercompletedstatechange.md)  
[PartyXblRequiredChatPermissionInfoChangedStateChange](../../../structs/partyxblrequiredchatpermissioninfochangedstatechange.md)
  
  
