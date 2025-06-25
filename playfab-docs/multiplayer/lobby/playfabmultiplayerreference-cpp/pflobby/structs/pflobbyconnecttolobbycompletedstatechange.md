---
author: ScottMunroMS
title: "PFLobbyConnectToLobbyCompletedStateChange"
description: "Information specific to the *ConnectToLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/10/2025
---

# PFLobbyConnectToLobbyCompletedStateChange  

Information specific to the *ConnectToLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyConnectToLobbyCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFEntityKey newMember;  
    const char* lobbyId;  
    void* asyncContext;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the ConnectToLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`newMember`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity provided to the call associated with this state change which is connecting to the lobby.
  
**`lobbyId`** &nbsp; const char*  
*is null-terminated*  
  
The lobby ID provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that was connected to.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
