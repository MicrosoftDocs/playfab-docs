---
author: ScottMunroMS
title: "PFLobbyPostUpdateCompletedStateChange"
description: "Information specific to the *PostUpdateCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFLobbyPostUpdateCompletedStateChange  

Information specific to the *PostUpdateCompleted* type of state change.  

## Syntax  
  
```cpp
<<<<<<< HEAD
struct PFLobbyPostUpdateCompletedStateChange {  
=======
struct PFLobbyPostUpdateCompletedStateChange : PFLobbyStateChange {  
>>>>>>> main
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
<<<<<<< HEAD
*_Notnull_*  
=======
*must not be null*  
>>>>>>> main
  
The lobby provided to the call associated with this state change.
  
**`localUser`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local user provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
