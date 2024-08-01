---
author: ScottMunroMS
title: "PFLobbyMemberConnectionStatus"
description: "Values representing the current status of a member's connection status to the notification service."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/09/2022
---

# PFLobbyMemberConnectionStatus  

Values representing the current status of a member's connection status to the notification service.    

## Syntax  
  
```cpp
enum class PFLobbyMemberConnectionStatus  : uint32_t  
{  
    NotConnected = 0,  
    Connected = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NotConnected | The lobby member is not connected to the notification service.<br/><br/> Lobby members that are not connected to the notification service may miss updates or see delayed updates while in this state. |  
| Connected | The lobby member is connected to the notification service.<br/><br/> Lobby members that are connected to the notification service will receive real-time updates indicating changes to the lobby. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
