---
author: ScottMunroMS
title: "PFLobbyJoinLobbyAsServerCompletedStateChange"
description: "Information specific to the *JoinLobbyAsServerCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/12/2024
---

# PFLobbyJoinLobbyAsServerCompletedStateChange  

Information specific to the *JoinLobbyAsServerCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyJoinLobbyAsServerCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFEntityKey newServer;  
    void* asyncContext;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the PFMultiplayerJoinLobbyAsServer() operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`newServer`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The server entity - which is joining the lobby - provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that was joined.
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
