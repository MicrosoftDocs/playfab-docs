---
author: ScottMunroMS
title: "PartyXblManager::CreateRemoteChatUser"
description: Creates a remote XBOX Live chat user and starts tracking privacy information for that user in relation to every local chat user.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblManager::CreateRemoteChatUser  

Creates a remote chat user. A remote chat user is an XBOX Live user currently communicating with at least one local user. Creating a remote chat user will cause the library to start tracking privacy information related to this user in relation to every local chat user.  

## Syntax  
  
```cpp
PartyError CreateRemoteChatUser(  
    uint64_t xboxUserId,  
    PartyXblChatUser** chatUser  
)  
```  
  
### Parameters  
  
**`xboxUserId`** &nbsp; uint64_t  
  
The XBOX user ID associated with the chat user.  
  
**`chatUser`** &nbsp; [PartyXblChatUser**](../../PartyXblChatUser/partyxblchatuser.md)  
*optional, library-allocated output*  
  
The output chat user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
If a remote chat user with the same `xboxUserId` already exists, this method fails with error `0x5001`. For more information, see [PlayFab Party XBOX Live Helper error codes](../../../partyxblerrors.md).
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::DestroyChatUser](partyxblmanager_destroychatuser.md)  

  
  
