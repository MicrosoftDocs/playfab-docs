---
author: ScottMunroMS
title: "PFLobbyInviteReceivedStateChange"
description: "Information specific to the *InviteReceived* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/10/2025
---

# PFLobbyInviteReceivedStateChange  

Information specific to the *InviteReceived* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyInviteReceivedStateChange : PFLobbyStateChange {  
    PFEntityKey listeningEntity;  
    PFEntityKey invitingEntity;  
    const char* connectionString;  
    const char* lobbyId;  
}  
```
  
### Members  
  
**`listeningEntity`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity which is listening for invites and which has been invited.
  
**`invitingEntity`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity which has invited the ```listeningEntity``` to a lobby.
  
**`connectionString`** &nbsp; const char*  
*is null-terminated*  
  
The connection string of the lobby to which the ```listeningEntity``` has been invited.
  
**`lobbyId`** &nbsp; const char*  
*is null-terminated*  
  
The ID of the lobby to which the ```listeningEntity``` has been invited.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
