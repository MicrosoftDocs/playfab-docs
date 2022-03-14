---
author: ScottMunroMS
title: "PFLobbyAddMemberCompletedStateChange"
description: "Information specific to the *AddMemberCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/14/2022
---

# PFLobbyAddMemberCompletedStateChange  

Information specific to the *AddMemberCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyAddMemberCompletedStateChange {  
    HRESULT result;  
    PFLobbyHandle lobby;  
    PFEntityKey localUser;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the AddMember operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; PFLobbyHandle  
*_Notnull_*  
  
The lobby used in the call associated with this state change.
  
**`localUser`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local user provided to the call associated with this state change.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
