---
author: ScottMunroMS
title: "PartyXblChatUser::GetXboxUserId"
description: Gets the Xbox Live User Id associated with this user.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/17/2020
---

# PartyXblChatUser::GetXboxUserId  

Gets the Xbox Live User Id associated with this user.  

## Syntax  
  
```cpp
PartyError GetXboxUserId(  
    uint64_t* xboxUserId  
)  
```  
  
### Parameters  
  
**`xboxUserId`** &nbsp; uint64_t*  
*output*  
  
The output Xbox Live User Id.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblChatUser](../partyxblchatuser.md)  

  
  
