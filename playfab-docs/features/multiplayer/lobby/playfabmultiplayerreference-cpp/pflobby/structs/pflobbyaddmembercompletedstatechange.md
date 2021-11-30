---
author: tomcoMSFT
title: "PFLobbyAddMemberCompletedStateChange"
description: "Information specific to the *AddMemberCompleted* type of state change."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyAddMemberCompletedStateChange  

Information specific to the *AddMemberCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyAddMemberCompletedStateChange {  
    result ;  
    _Notnull_ lobby;  
    PFEntityKey localUser;  
    void* asyncContext;  
} PFLobbyAddMemberCompletedStateChange  
```
  
### Members  
  
**``** &nbsp; result  
  
Indicates the result of the AddMember operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby used in the call associated with this state change.
  
**`localUser`** &nbsp; PFEntityKey  
  
The local user provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
