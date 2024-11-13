---
author: ScottMunroMS
title: "PFLobbyDisconnectingReason"
description: "Reasons the client no longer has access to the Lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyDisconnectingReason  

Reasons the client no longer has access to the Lobby.    

## Syntax  
  
```cpp
enum class PFLobbyDisconnectingReason  : uint32_t  
{  
    NoLocalMembers = 0,  
    LobbyDeleted = 1,  
    ConnectionInterruption = 2,  
    LobbyServerLeft = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoLocalMembers | The client is no longer connected to the lobby because none of the client's local entities are members. |  
| LobbyDeleted | The client is being disconnected from the lobby because the lobby's server owner deleted the lobby. |  
| ConnectionInterruption | The client is being disconnected from the lobby because the client lost connection. |  
| LobbyServerLeft | The client is being disconnected from the lobby because the lobby server left the lobby. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
