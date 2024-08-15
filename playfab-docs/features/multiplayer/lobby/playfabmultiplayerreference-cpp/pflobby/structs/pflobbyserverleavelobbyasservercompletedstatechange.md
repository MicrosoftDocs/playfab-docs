---
author: ScottMunroMS
title: "PFLobbyServerLeaveLobbyAsServerCompletedStateChange"
description: "Information specific to the *ServerLeaveLobbyAsServerCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/12/2024
---

# PFLobbyServerLeaveLobbyAsServerCompletedStateChange  

Information specific to the *ServerLeaveLobbyAsServerCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyServerLeaveLobbyAsServerCompletedStateChange : PFLobbyStateChange {  
    PFLobbyHandle lobby;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
