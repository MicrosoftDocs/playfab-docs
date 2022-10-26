---
author: ScottMunroMS
title: "PFLobbyDisconnectingReason"
description: "Reasons the client no longer has access to the Lobby."
ms.author: scmunro
ms.topic: reference
ms.service: playfab
ms.date: 03/11/2022
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
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoLocalMembers | The client is no longer connected to the lobby because none of the client's local entities are members. |  
| LobbyDeleted | The client is being disconnected from the lobby because the lobby's server owner has deleted the lobby. |  
| ConnectionInterruption | The client is being disconnected from the lobby because the client has lost connection. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
