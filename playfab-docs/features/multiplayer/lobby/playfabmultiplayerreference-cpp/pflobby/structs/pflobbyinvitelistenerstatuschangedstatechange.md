---
author: ScottMunroMS
title: "PFLobbyInviteListenerStatusChangedStateChange"
description: "Information specific to the *InviteListenerStatusChanged* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyInviteListenerStatusChangedStateChange  

Information specific to the *InviteListenerStatusChanged* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyInviteListenerStatusChangedStateChange {  
    PFEntityKey listeningEntity;  
} PFLobbyInviteListenerStatusChangedStateChange  
```
  
### Members  
  
**`listeningEntity`** &nbsp; PFEntityKey  
  
The entity associated with the invite listener.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
