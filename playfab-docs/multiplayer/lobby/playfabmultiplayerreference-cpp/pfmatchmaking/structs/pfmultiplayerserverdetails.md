---
author: ScottMunroMS
title: "PFMultiplayerServerDetails"
description: "Details about a Playfab Multiplayer Server."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/16/2022
---

# PFMultiplayerServerDetails  

Details about a Playfab Multiplayer Server.  

## Syntax  
  
```cpp
struct PFMultiplayerServerDetails {  
    const char* fqdn;  
    const char* ipv4Address;  
    const PFMultiplayerPort* ports;  
    uint32_t portCount;  
    const char* region;  
}  
```
  
### Members  
  
**`fqdn`** &nbsp; const char*  
*is null-terminated*  
  
The fully qualified domain name of the virtual machine that is hosting this multiplayer server.
  
**`ipv4Address`** &nbsp; const char*  
*is null-terminated*  
  
The IPv4 address of the virtual machine that is hosting this multiplayer server.
  
**`ports`** &nbsp; const [PFMultiplayerPort](pfmultiplayerport.md)*  
  
The ports the multiplayer server uses.
  
**`portCount`** &nbsp; uint32_t  
  
The number of ports the multiplayer server uses.
  
**`region`** &nbsp; const char*  
*is null-terminated*  
  
The server's region.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
