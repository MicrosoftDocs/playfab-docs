---
author: ScottMunroMS
title: "PFLobbyServerDeleteLobbyCompletedStateChange"
description: "Information specific to the *ServerDeleteLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyServerDeleteLobbyCompletedStateChange  

Information specific to the *ServerDeleteLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyServerDeleteLobbyCompletedStateChange : PFLobbyStateChange {  
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
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
