---
author: ScottMunroMS
title: "PFMultiplayerProtocolType"
description: "The protocol type used for connecting to a PlayFab Multiplayer Server port."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/16/2022
---

# PFMultiplayerProtocolType  

The protocol type used for connecting to a PlayFab Multiplayer Server port.    

## Syntax  
  
```cpp
enum class PFMultiplayerProtocolType  : uint32_t  
{  
    Tcp = 0,  
    Udp = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Tcp | Transmission Control Protocol |  
| Udp | User Datagram Protocol |  
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
