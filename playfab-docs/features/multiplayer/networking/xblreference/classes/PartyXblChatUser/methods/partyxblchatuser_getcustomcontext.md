---
author: ScottMunroMS
title: "PartyXblChatUser::GetCustomContext"
description: Retrieves the app's private, custom pointer-sized context value previously associated with this local chat user object.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/01/2019
---

# PartyXblChatUser::GetCustomContext  

Retrieves the app's private, custom pointer-sized context value previously associated with this local chat user object.  

## Syntax  
  
```cpp
PartyError GetCustomContext(  
    void** customContext  
)  
```  
  
### Parameters  
  
**`customContext`** &nbsp; void**  
*output, may return nullptr*  
  
The output custom context.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if retrieving the custom context succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
## Remarks  
  
If no custom context has been set yet, the value pointed to by `customContext` is set to nullptr.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblChatUser](../partyxblchatuser.md)  
[PartyXblChatUser::SetCustomContext](partyxblchatuser_setcustomcontext.md)
  
  
