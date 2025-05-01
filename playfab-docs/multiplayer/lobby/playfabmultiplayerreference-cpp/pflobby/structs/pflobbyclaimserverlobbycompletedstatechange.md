---
author: ScottMunroMS
title: "PFLobbyClaimServerLobbyCompletedStateChange"
description: "Information specific to the *ClaimServerLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyClaimServerLobbyCompletedStateChange  

Information specific to the *ClaimServerLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyClaimServerLobbyCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    void* asyncContext;  
    const char* lobbyId;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the ClaimServerLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobbyId`** &nbsp; const char*  
*is null-terminated*  
  
The lobby ID provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that was created and joined.
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
