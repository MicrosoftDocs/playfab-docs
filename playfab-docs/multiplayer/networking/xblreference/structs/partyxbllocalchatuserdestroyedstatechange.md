---
author: ScottMunroMS
title: "PartyXblLocalChatUserDestroyedStateChange"
description: "Information specific to the *LocalChatUserDestroyed* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyXblLocalChatUserDestroyedStateChange  

Information specific to the *LocalChatUserDestroyed* type of state change.  

## Syntax  
  
```cpp
struct PartyXblLocalChatUserDestroyedStateChange : PartyXblStateChange {  
    PartyXblLocalChatUser* localChatUser;  
    PartyXblLocalChatUserDestroyedReason reason;  
    PartyError errorDetail;  
}  
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

  
  
