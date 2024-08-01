---
author: ScottMunroMS
title: "PFLobbyServerJoinConfiguration"
description: "The initial configuration data used when joining a client-owned lobby as a server."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/12/2024
---

# PFLobbyServerJoinConfiguration  

The initial configuration data used when joining a client-owned lobby as a server.  

## Syntax  
  
```cpp
struct PFLobbyServerJoinConfiguration {  
    uint32_t serverPropertyCount;  
    const char* const* serverPropertyKeys;  
    const char* const* serverPropertyValues;  
}  
```
  
### Members  
  
**`serverPropertyCount`** &nbsp; uint32_t  
  
The number of initial properties for the server joining the lobby.
  
There may only be ```PFLobbyMaxServerPropertyCount``` concurrent properties at any given time.
  
**`serverPropertyKeys`** &nbsp; const char* const*  
*array of size `serverPropertyCount`*  
  
The keys of the initial properties for the server joining the lobby.
  
**`serverPropertyValues`** &nbsp; const char* const*  
*array of size `serverPropertyCount`*  
  
The values of the initial properties for the server joining the lobby.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
