---
author: ScottMunroMS
title: "PFLobbyPostUpdateCompletedStateChange"
description: "Information specific to the *PostUpdateCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyPostUpdateCompletedStateChange  

Information specific to the *PostUpdateCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyPostUpdateCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFLobbyHandle lobby;  
    PFEntityKey localUser;  
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
  
**`localUser`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local user provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
