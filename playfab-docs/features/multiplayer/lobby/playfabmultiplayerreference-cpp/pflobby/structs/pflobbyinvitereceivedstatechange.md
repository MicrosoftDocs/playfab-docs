---
author: ScottMunroMS
title: "PFLobbyInviteReceivedStateChange"
description: "Information specific to the *InviteReceived* type of state change."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyInviteReceivedStateChange  

Information specific to the *InviteReceived* type of state change.  

## Syntax  
  
```cpp
typedef struct PFLobbyInviteReceivedStateChange {  
    PFEntityKey listeningEntity;  
    PFEntityKey invitingEntity;  
    const char* connectionString;  
} PFLobbyInviteReceivedStateChange  
```
  
### Members  
  
**`listeningEntity`** &nbsp; PFEntityKey  
  
The entity which is listening for invites and which has been invited.
  
**`invitingEntity`** &nbsp; PFEntityKey  
  
The entity which has invited the ```listeningEntity``` to a lobby.
  
**`connectionString`** &nbsp; const char*  
*_Null_terminated_*  
  
The connection string of the lobby to which the ```listeningEntity``` has been invited.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
