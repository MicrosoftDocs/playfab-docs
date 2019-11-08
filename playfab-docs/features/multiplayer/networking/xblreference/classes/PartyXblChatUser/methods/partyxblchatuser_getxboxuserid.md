---
author: alexatxbox
title: "PartyXblChatUser::GetXboxUserId"
description: Gets the Xbox Live User Id associated with this user.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*library-allocated output*  
  
The output xbox user id.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblChatUser](../partyxblchatuser.md)  

  
  
