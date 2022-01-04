---
author: ScottMunroMS
title: "PFLobbyLeaveLobbyCompletedStateChange"
description: "Information specific to the *LeaveLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyLeaveLobbyCompletedStateChange  

Information specific to the *LeaveLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyLeaveLobbyCompletedStateChange {  
    _Notnull_ lobby;  
    const PFEntityKey* localUser;  
    void* asyncContext;  
} PFLobbyLeaveLobbyCompletedStateChange  
```
  
### Members  
  
**`lobby`** &nbsp; _Notnull_  
  
The lobby provided to the call associated with this state change.
  
**`localUser`** &nbsp; const PFEntityKey*  
*may be nullptr*  
  
The local user provided to the call associated with this state change. May be null.
  
If this value is null it signifies that the title requested all local members leave the specified lobby.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
