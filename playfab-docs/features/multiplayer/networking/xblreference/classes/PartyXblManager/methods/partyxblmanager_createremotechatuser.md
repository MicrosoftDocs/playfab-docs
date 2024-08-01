---
author: ScottMunroMS
title: "PartyXblManager::CreateRemoteChatUser"
description: Creates a remote chat user. A remote chat user is an Xbox Live user currently communicating with at least one local user. Creating a remote chat user will cause the library to start tracking privacy information related to this user in relation to every local chat user.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/01/2019
---

# PartyXblManager::CreateRemoteChatUser  

Creates a remote chat user. A remote chat user is an Xbox Live user currently communicating with at least one local user. Creating a remote chat user will cause the library to start tracking privacy information related to this user in relation to every local chat user.  

## Syntax  
  
```cpp
PartyError CreateRemoteChatUser(  
    uint64_t xboxUserId,  
    PartyXblChatUser** chatUser  
)  
```  
  
### Parameters  
  
**`xboxUserId`** &nbsp; uint64_t  
  
The Xbox Live user id associated with the chat user.  
  
**`chatUser`** &nbsp; [PartyXblChatUser**](../../PartyXblChatUser/partyxblchatuser.md)  
*optional, library-allocated output*  
  
The output chat user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  

  
  
