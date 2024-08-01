---
author: ScottMunroMS
title: "PFMultiplayerPort"
description: "A port used by a Playfab Multiplayer Server."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/16/2022
---

# PFMultiplayerPort  

A port used by a Playfab Multiplayer Server.  

## Syntax  
  
```cpp
struct PFMultiplayerPort {  
    const char* name;  
    uint32_t num;  
    PFMultiplayerProtocolType protocol;  
}  
```
  
### Members  
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of the port as specified in the PlayFab Game Manager server settings.
  
**`num`** &nbsp; uint32_t  
  
The number for the port.
  
**`protocol`** &nbsp; [PFMultiplayerProtocolType](../enums/pfmultiplayerprotocoltype.md)  
  
The protocol for the port.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
