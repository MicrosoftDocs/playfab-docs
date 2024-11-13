---
author: ScottMunroMS
title: "PFLobbyCreateAndClaimServerLobbyCompletedStateChange"
description: "Information specific to the *CreateAndClaimServerLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyCreateAndClaimServerLobbyCompletedStateChange  

Information specific to the *CreateAndClaimServerLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyCreateAndClaimServerLobbyCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    void* asyncContext;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the CreateAndClaimServerLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that was created and joined.
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
