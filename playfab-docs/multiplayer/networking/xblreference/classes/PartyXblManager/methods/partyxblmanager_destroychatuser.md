---
author: ScottMunroMS
title: "PartyXblManager::DestroyChatUser"
description: Destroys a chat user.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblManager::DestroyChatUser  

Destroys a chat user.  

## Syntax  
  
```cpp
PartyError DestroyChatUser(  
    const PartyXblChatUser* chatUser  
)  
```  
  
### Parameters  
  
**`chatUser`** &nbsp; [PartyXblChatUser*](../../PartyXblChatUser/partyxblchatuser.md)  
  
The chat user object to be destroyed.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblManager](../partyxblmanager.md)  

  
  
