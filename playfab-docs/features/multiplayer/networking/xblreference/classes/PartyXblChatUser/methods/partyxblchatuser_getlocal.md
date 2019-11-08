---
author: alexatxbox
title: "PartyXblChatUser::GetLocal"
description: Gets the PartyXblLocalChatUser version of this chat user.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblChatUser::GetLocal  

Gets the PartyXblLocalChatUser version of this chat user.  

## Syntax  
  
```cpp
PartyError GetLocal(  
    PartyXblLocalChatUser** localChatUser  
)  
```  
  
### Parameters  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser**](../../PartyXblLocalChatUser/partyxbllocalchatuser.md)  
*output, may return nullptr*  
  
The output local version of this chat user object, or nullptr if this is not a local chat user.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyXblManager::GetErrorMessage()](../../PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblChatUser](../partyxblchatuser.md)  

  
  
