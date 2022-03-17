---
author: ScottMunroMS
title: "PFLobbyInviteListenerStatusChangedStateChange"
description: "Information specific to the *InviteListenerStatusChanged* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 03/15/2022
---

# PFLobbyInviteListenerStatusChangedStateChange  

Information specific to the *InviteListenerStatusChanged* type of state change.  

## Syntax  
  
```cpp
<<<<<<< HEAD
struct PFLobbyInviteListenerStatusChangedStateChange {  
=======
struct PFLobbyInviteListenerStatusChangedStateChange : PFLobbyStateChange {  
>>>>>>> main
    PFEntityKey listeningEntity;  
}  
```
  
### Members  
  
**`listeningEntity`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity associated with the invite listener.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
