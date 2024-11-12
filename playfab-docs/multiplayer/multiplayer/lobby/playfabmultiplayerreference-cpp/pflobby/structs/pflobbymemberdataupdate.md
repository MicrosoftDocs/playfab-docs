---
author: ScottMunroMS
title: "PFLobbyMemberDataUpdate"
description: "A request to make an update to the member-owned portion of the lobby document."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyMemberDataUpdate  

A request to make an update to the member-owned portion of the lobby document.  

## Syntax  
  
```cpp
struct PFLobbyMemberDataUpdate {  
    uint32_t memberPropertyCount;  
    const char* const* memberPropertyKeys;  
    const char* const* memberPropertyValues;  
}  
```
  
### Members  
  
**`memberPropertyCount`** &nbsp; uint32_t  
  
The number of member properties to update for the updating member.
  
There may only be ```PFLobbyMaxMemberPropertyCount``` concurrent properties at any given time per-member. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted. <br /><br /> If the property limits are violated, the entire update operation will fail.
  
**`memberPropertyKeys`** &nbsp; const char* const*  
*array of size `memberPropertyCount`*  
  
The keys of the member properties to update for the updating member.
  
Per-member properties are only visible to members of the lobby. <br /><br /> Only the properties specified in this list of keys will be updated. If the key doesn't exist yet, the property will be created. If the new property value is nullptr, the property will be deleted. Any existing properties omitted from this list will be left unmodified.
  
**`memberPropertyValues`** &nbsp; const char* const*  
*array of size `memberPropertyCount`*  
  
The values of the member properties to update for the updating member.
  
Per-member properties are only visible to members of the lobby. <br /><br /> To delete a value, provide nullptr as its new value.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
