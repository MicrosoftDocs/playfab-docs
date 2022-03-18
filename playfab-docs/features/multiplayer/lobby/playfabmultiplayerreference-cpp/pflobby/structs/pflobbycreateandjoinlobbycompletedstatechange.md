---
author: ScottMunroMS
title: "PFLobbyCreateAndJoinLobbyCompletedStateChange"
description: "Information specific to the *CreateAndJoinLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFLobbyCreateAndJoinLobbyCompletedStateChange  

Information specific to the *CreateAndJoinLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
<<<<<<< HEAD
struct PFLobbyCreateAndJoinLobbyCompletedStateChange {  
=======
struct PFLobbyCreateAndJoinLobbyCompletedStateChange : PFLobbyStateChange {  
>>>>>>> main
    HRESULT result;  
    void* asyncContext;  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the CreateAndJoinLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; PFLobbyHandle  
<<<<<<< HEAD
*_Notnull_*  
=======
*must not be null*  
>>>>>>> main
  
The lobby that was created and joined.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
