---
author: ScottMunroMS
title: "PFLobbyMemberDataUpdate"
description: "A request to make an update to the member-owned portion of the lobby document."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyMemberDataUpdate  

A request to make an update to the member-owned portion of the lobby document.  

## Syntax  
  
```cpp
typedef struct PFLobbyMemberDataUpdate {  
    uint32_t memberPropertyCount;  
    const char* memberPropertyKeys;  
    const char* memberPropertyValues;  
} PFLobbyMemberDataUpdate  
```
  
### Members  
  
**`memberPropertyCount`** &nbsp; uint32_t  
  
The number of member properties to update for the updating member.
  
There may only be ```PFLobbyMaxMemberPropertyCount``` concurrent properties at any given time per-member. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted. <br /><br /> If the property limits are violated, the entire update operation will fail.
  
**`memberPropertyKeys`** &nbsp; const char*  
*array of size `memberPropertyCount`*  
  
The keys of the member properties to update for the updating member.
  
Per-member properties are only visible to members of the lobby.
  
**`memberPropertyValues`** &nbsp; const char*  
*array of size `memberPropertyCount`*  
  
The values of the member properties to update for the updating member.
  
Per-member properties are only visible to members of the lobby. <br /><br /> To delete a value, provide nullptr as its new value.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
