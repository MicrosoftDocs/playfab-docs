---
author: alexatxbox
title: "PartyXblLocalChatUserDestroyedStateChange"
description: "Information specific to the *LocalChatUserDestroyed* type of state change."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblLocalChatUserDestroyedStateChange  

Information specific to the *LocalChatUserDestroyed* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyXblLocalChatUserDestroyedStateChange {  
    PartyXblLocalChatUser* localChatUser;  
    PartyXblLocalChatUserDestroyedReason reason;  
    PartyError errorDetail;  
} PartyXblLocalChatUserDestroyedStateChange  
```
  
### Members  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
  
The local chat user provided to the call associated with this state change.
  
**`reason`** &nbsp; [PartyXblLocalChatUserDestroyedReason](../enums/partyxbllocalchatuserdestroyedreason.md)  
  
The reason the local chat user was destroyed.
  
**`errorDetail`** &nbsp; [PartyError](../../../networking/reference/typedefs.md)  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyXblManager::GetErrorMessage()](../classes/PartyXblManager/methods/partyxblmanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
