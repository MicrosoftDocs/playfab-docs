---
author: ScottMunroMS
title: "PartyXblChatUser::SetCustomContext"
description: Configures an optional, custom pointer-sized context value with this local chat user object.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/01/2019
---

# PartyXblChatUser::SetCustomContext  

Configures an optional, custom pointer-sized context value with this local chat user object.  

## Syntax  
  
```cpp
PartyError SetCustomContext(  
    void* customContext  
)  
```  
  
### Parameters  
  
**`customContext`** &nbsp; void*  
*optional*  
  
An arbitrary, pointer-sized value to store with the chat user object.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if configuring the custom context succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
## Remarks  
  
The custom context is typically used as a "shortcut" that simplifies accessing local, title-specific memory associated with the chat user without requiring a mapping lookup. The value is retrieved using the [GetCustomContext()](partyxblchatuser_getcustomcontext.md) method. <br /><br /> Any configured value is treated as opaque by the library, and is only valid on the local device; it is not transmitted over the network.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblChatUser](../partyxblchatuser.md)  
[PartyXblChatUser::GetCustomContext](partyxblchatuser_getcustomcontext.md)
  
  
