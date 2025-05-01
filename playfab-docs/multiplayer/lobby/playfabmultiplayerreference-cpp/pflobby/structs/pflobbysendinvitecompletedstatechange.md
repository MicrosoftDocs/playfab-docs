---
author: ScottMunroMS
title: "PFLobbySendInviteCompletedStateChange"
description: "Information specific to the *SendInviteCompleted* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbySendInviteCompletedStateChange  

Information specific to the *SendInviteCompleted* type of state change.  

## Syntax  
  
```cpp
struct PFLobbySendInviteCompletedStateChange : PFLobbyStateChange {  
    HRESULT result;  
    PFLobbyHandle lobby;  
    PFEntityKey sender;  
    PFEntityKey invitee;  
    void* asyncContext;  
}  
```
  
### Members  
  
**`result`** &nbsp; HRESULT  
  
Indicates the result of the SendInvite operation.
  
The human-readable form of this result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that the invite was sent for.
  
**`sender`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local user which attempted to send the invite.
  
**`invitee`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity which was invited.
  
**`asyncContext`** &nbsp; void*  
  
The async context provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
