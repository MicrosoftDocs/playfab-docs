---
author: ScottMunroMS
title: "PFLobbySendInviteCompletedStateChange"
description: "Information specific to the *SendInviteCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbySendInviteCompletedStateChange  

Information specific to the *SendInviteCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbySendInviteCompletedStateChange {  
    result ;  
    _Notnull_ lobby;  
    PFEntityKey sender;  
    PFEntityKey invitee;  
    void* asyncContext;  
} PFLobbySendInviteCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
Indicates the result of the SendInvite operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby that the invite was sent for.
  
**`sender`** &nbsp; PFEntityKey  
  
The local user which attempted to send the invite.
  
**`invitee`** &nbsp; PFEntityKey  
  
The entity which was invited.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
