---
author: ScottMunroMS
title: "PFLobbyJoinConfiguration"
description: "The initial configuration data used when joining a lobby."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyJoinConfiguration  

The initial configuration data used when joining a lobby.  

## Syntax  
  
```cpp
typedef struct PFLobbyJoinConfiguration {  
    uint32_t memberPropertyCount;  
    const char* memberPropertyKeys;  
    const char* memberPropertyValues;  
} PFLobbyJoinConfiguration  
```
  
### Members  
  
**`memberPropertyCount`** &nbsp; uint32_t  
  
The number of initial member properties for the joiner of the lobby.
  
**`memberPropertyKeys`** &nbsp; const char*  
*array of size `memberPropertyCount`*  
  
The keys of the initial member properties for the joiner of the lobby.
  
Per-member properties are only visible to members of the lobby.
  
**`memberPropertyValues`** &nbsp; const char*  
*array of size `memberPropertyCount`*  
  
The values of the initial member properties for the joiner of the lobby.
  
Per-member properties are only visible to members of the lobby.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
