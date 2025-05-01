---
author: ScottMunroMS
title: "PFLobbyServerPostUpdateAsServerCompletedStateChange"
description: "Information specific to the *ServerPostUpdateAsServerCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/12/2024
---

# PFLobbyServerPostUpdateAsServerCompletedStateChange  

Information specific to the *ServerPostUpdateAsServerCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyServerPostUpdateAsServerCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFLobbyHandle lobby;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the update operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
