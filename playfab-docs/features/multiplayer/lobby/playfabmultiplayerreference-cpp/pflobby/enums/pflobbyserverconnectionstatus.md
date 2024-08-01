---
author: ScottMunroMS
title: "PFLobbyServerConnectionStatus"
description: "Values representing the current status of the Lobby Server's connection status to the notification service."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyServerConnectionStatus  

Values representing the current status of the Lobby Server's connection status to the notification service.    

## Syntax  
  
```cpp
enum class PFLobbyServerConnectionStatus  : uint32_t  
{  
    NotConnected = 0,  
    Connected = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NotConnected | The Lobby Server isn't connected to the notification service.<br/><br/> When not connected to the notification service, the Lobby Server can miss updates or see delayed updates while in this state. |  
| Connected | The Lobby Server is connected to the notification service.<br/><br/> When connected to the notification service, the Lobby Server will receive real-time updates indicating changes to the lobby. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
