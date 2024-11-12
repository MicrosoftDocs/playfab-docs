---
author: ScottMunroMS
title: "PartyXblManager::GetChatUsers"
description: Gets an array containing all chat users created by [CreateLocalChatUser()](partyxblmanager_createlocalchatuser.md) and [CreateRemoteChatUser()](partyxblmanager_createremotechatuser.md).
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyXblManager::GetChatUsers  

Gets an array containing all chat users created by [CreateLocalChatUser()](partyxblmanager_createlocalchatuser.md) and [CreateRemoteChatUser()](partyxblmanager_createremotechatuser.md).  

## Syntax  
  
```cpp
PartyError GetChatUsers(  
    uint32_t* userCount,  
    PartyXblChatUserArray* chatUsers  
)  
```  
  
### Parameters  
  
**`userCount`** &nbsp; uint32_t*  
*output*  
  
An output value indicating the number of chat users provided in `chatUsers`.  
  
**`chatUsers`** &nbsp; [PartyXblChatUserArray*](../../../../../networking/xblreference/xbltypedefs.md)  
*library-allocated output array of size `*endpointCount`*  
  
A library-allocated output array containing the local and remote chat users.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
The array is backed by the library's internal memory. The array is only valid until the next call to either [CreateLocalChatUser()](partyxblmanager_createlocalchatuser.md), [CreateRemoteChatUser()](partyxblmanager_createremotechatuser.md), [StartProcessingStateChanges()](partyxblmanager_startprocessingstatechanges.md) or [DestroyChatUser()](partyxblmanager_destroychatuser.md). A call to DestroyChatUser() will also immediately invalidate the chat user object.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::CreateLocalChatUser](partyxblmanager_createlocalchatuser.md)  
[PartyXblManager::CreateRemoteChatUser](partyxblmanager_createremotechatuser.md)  
[PartyXblManager::DestroyChatUser](partyxblmanager_destroychatuser.md)
  
  
