---
author: ScottMunroMS
title: "PFLobbyJoinArrangedLobbyCompletedStateChange"
description: "Information specific to the *JoinArrangedLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyJoinArrangedLobbyCompletedStateChange  

Information specific to the *JoinArrangedLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyJoinArrangedLobbyCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFEntityKey newMember;  
    void* asyncContext;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the JoinArrangedLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`newMember`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local member entity provided to the call associated with this state change which is joining this lobby.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that was created and joined.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
