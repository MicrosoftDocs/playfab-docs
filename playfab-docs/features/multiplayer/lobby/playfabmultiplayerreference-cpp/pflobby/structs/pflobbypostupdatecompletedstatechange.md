---
author: ScottMunroMS
title: "PFLobbyPostUpdateCompletedStateChange"
description: "Information specific to the *PostUpdateCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyPostUpdateCompletedStateChange  

Information specific to the *PostUpdateCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyPostUpdateCompletedStateChange {  
    result ;  
    _Notnull_ lobby;  
    PFEntityKey localUser;  
    void* asyncContext;  
} PFLobbyPostUpdateCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
Indicates the result of the update operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby provided to the call associated with this state change.
  
**`localUser`** &nbsp; PFEntityKey  
  
The local user provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
