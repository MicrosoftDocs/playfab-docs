---
author: ScottMunroMS
title: "PFLobbyJoinLobbyCompletedStateChange"
description: "Information specific to the *JoinLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyJoinLobbyCompletedStateChange  

Information specific to the *JoinLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyJoinLobbyCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFEntityKey newMember;  
    void* asyncContext;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the JoinLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`newMember`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity provided to the call associated with this state change which is joining the lobby.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that was joined.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
