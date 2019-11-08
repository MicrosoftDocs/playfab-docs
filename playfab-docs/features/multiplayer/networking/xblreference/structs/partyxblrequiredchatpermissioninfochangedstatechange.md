---
author: alexatxbox
title: "PartyXblRequiredChatPermissionInfoChangedStateChange"
description: "Information specific to the *RequiredChatPermissionInfoChanged* type of state change."
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblRequiredChatPermissionInfoChangedStateChange  

Information specific to the *RequiredChatPermissionInfoChanged* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyXblRequiredChatPermissionInfoChangedStateChange {  
    PartyXblLocalChatUser* localChatUser;  
    PartyXblChatUser* targetChatUser;  
} PartyXblRequiredChatPermissionInfoChangedStateChange  
```
  
### Members  
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
  
The local chat user for which the chat permission info applies to.
  
**`targetChatUser`** &nbsp; [PartyXblChatUser](../classes/PartyXblChatUser/partyxblchatuser.md)*  
  
The chat user the chat permission info should be applied to.
  
## Remarks  
  
Use [PartyXblLocalChatUser::GetRequiredChatPermissionInfo()](../classes/PartyXblLocalChatUser/methods/partyxbllocalchatuser_getrequiredchatpermissioninfo.md) with the ```targetChatUser``` provided in this state change to get the new chat permission information.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
