---
author: tomcoMSFT
title: "PFLobbyJoinArrangedLobbyCompletedStateChange"
description: "Information specific to the *JoinArrangedLobbyCompleted* type of state change."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyJoinArrangedLobbyCompletedStateChange  

Information specific to the *JoinArrangedLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyJoinArrangedLobbyCompletedStateChange {  
    result ;  
    PFEntityKey newMember;  
    void* asyncContext;  
    _Notnull_ lobby;  
} PFLobbyJoinArrangedLobbyCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
Indicates the result of the JoinArrangedLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`newMember`** &nbsp; PFEntityKey  
  
The local member entity provided to the call associated with this state change which is joining this lobby.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby that was created and joined.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
