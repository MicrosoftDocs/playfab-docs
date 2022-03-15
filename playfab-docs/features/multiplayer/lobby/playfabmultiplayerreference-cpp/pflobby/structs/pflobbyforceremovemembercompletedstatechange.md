---
author: ScottMunroMS
title: "PFLobbyForceRemoveMemberCompletedStateChange"
description: "Information specific to the *ForceRemoveMemberCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/14/2022
---

# PFLobbyForceRemoveMemberCompletedStateChange  

Information specific to the *ForceRemoveMemberCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyForceRemoveMemberCompletedStateChange {  
    HRESULT result;  
    PFLobbyHandle lobby;  
    PFEntityKey targetMember;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the ForceRemoveMember operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; PFLobbyHandle  
*_Notnull_*  
  
The lobby provided to the call associated with this state change.
  
**`targetMember`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The member entity provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
