---
author: ScottMunroMS
title: "PartyXblChatUser::GetXboxUserId"
description: "PartyXblChatUser::GetXboxUserId in PartyXboxLive.h returns the XBOX user ID (XUID) tied to a chat user in the PlayFab Party XBOX Live helper library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblChatUser::GetXboxUserId  

Gets the XBOX user ID associated with this user.  

## Syntax  
  
```cpp
PartyError GetXboxUserId(  
    uint64_t* xboxUserId  
)  
```  
  
### Parameters  
  
**`xboxUserId`** &nbsp; uint64_t*  
*output*  
  
The output XBOX user ID.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblChatUser](../partyxblchatuser.md)  

  
  
