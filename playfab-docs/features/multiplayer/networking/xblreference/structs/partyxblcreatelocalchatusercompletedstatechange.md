---
author: ScottMunroMS
title: "PartyXblCreateLocalChatUserCompletedStateChange"
description: "Information specific to the *CreateLocalChatUserCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
---

# PartyXblCreateLocalChatUserCompletedStateChange  

Information specific to the *CreateLocalChatUserCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyXblCreateLocalChatUserCompletedStateChange {  
    PartyXblStateChangeResult result;  
    PartyError errorDetail;  
    void* asyncIdentifier;  
    PartyXblLocalChatUser* localChatUser;  
} PartyXblCreateLocalChatUserCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyXblStateChangeResult](../enums/partyxblstatechangeresult.md)  
  
Indicates that the local chat user creation operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; [PartyError](../../../networking/reference/typedefs.md)  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`localChatUser`** &nbsp; [PartyXblLocalChatUser](../classes/PartyXblLocalChatUser/partyxbllocalchatuser.md)*  
  
The local chat user that was created.
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  

  
  
