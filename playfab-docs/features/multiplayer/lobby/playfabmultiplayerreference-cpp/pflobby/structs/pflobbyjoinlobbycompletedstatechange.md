---
author: ScottMunroMS
title: "PFLobbyJoinLobbyCompletedStateChange"
description: "Information specific to the *JoinLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyJoinLobbyCompletedStateChange  

Information specific to the *JoinLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyJoinLobbyCompletedStateChange {  
    result ;  
    PFEntityKey newMember;  
    void* asyncContext;  
    _Notnull_ lobby;  
} PFLobbyJoinLobbyCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
Indicates the result of the JoinLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`newMember`** &nbsp; PFEntityKey  
  
The entity provided to the call associated with this state change which is joining the lobby.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby that was joined.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
