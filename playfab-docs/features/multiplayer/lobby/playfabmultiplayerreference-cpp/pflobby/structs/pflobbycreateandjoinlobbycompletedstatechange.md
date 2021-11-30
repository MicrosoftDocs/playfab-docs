---
author: tomcoMSFT
title: "PFLobbyCreateAndJoinLobbyCompletedStateChange"
description: "Information specific to the *CreateAndJoinLobbyCompleted* type of state change."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyCreateAndJoinLobbyCompletedStateChange  

Information specific to the *CreateAndJoinLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyCreateAndJoinLobbyCompletedStateChange {  
    result ;  
    void* asyncContext;  
    _Notnull_ lobby;  
} PFLobbyCreateAndJoinLobbyCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
Indicates the result of the CreateAndJoinLobby operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby that was created and joined.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
