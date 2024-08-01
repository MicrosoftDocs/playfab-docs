---
author: ScottMunroMS
title: "PFLobbyLeaveLobbyCompletedStateChange"
description: "Information specific to the *LeaveLobbyCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyLeaveLobbyCompletedStateChange  

Information specific to the *LeaveLobbyCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyLeaveLobbyCompletedStateChange : PFLobbyStateChange {  
    PFLobbyHandle lobby;  
    const PFEntityKey* localUser;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby provided to the call associated with this state change.
  
**`localUser`** &nbsp; const [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)*  
*may be nullptr*  
  
The local user provided to the call associated with this state change. May be null.
  
If this value is null it signifies that the title requested all local members leave the specified lobby.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
