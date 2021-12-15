---
author: alexatxbox
title: "PartyXblManager::CreateLocalChatUser"
description: Queues an asynchronous attempt to create a local chat user. Privacy and privilege information related to this user will be tracked by the helper library.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblManager::CreateLocalChatUser  

Queues an asynchronous attempt to create a local chat user. Privacy and privilege information related to this user will be tracked by the helper library.  

## Syntax  
  
```cpp
PartyError CreateLocalChatUser(  
    uint64_t xboxUserId,  
    void* asyncIdentifier,  
    PartyXblLocalChatUser** localChatUser  
)  
```  
  
### Parameters  
  
**`xboxUserId`** &nbsp; uint64_t  
  
The Xbox Live user id associated with the local chat user.  
  
**`asyncIdentifier`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser**](../../PartyXblLocalChatUser/partyxbllocalchatuser.md)  
*optional, library-allocated output*  
  
The ouput local chat user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  

  
  
