---
author: tomcoMSFT
title: "PFLobbyMemberUpdateSummary"
description: "A collection of hints about an update which has been successfully applied to the lobby on behalf of a member."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 10/27/2021
---

# PFLobbyMemberUpdateSummary  

A collection of hints about an update which has been successfully applied to the lobby on behalf of a member.  

## Syntax  
  
```cpp
typedef struct PFLobbyMemberUpdateSummary {  
    PFEntityKey member;  
    bool connectionStatusUpdated;  
    uint32_t updatedMemberPropertyCount;  
    const char* updatedMemberPropertyKeys;  
} PFLobbyMemberUpdateSummary  
```
  
### Members  
  
**`member`** &nbsp; PFEntityKey  
  
The member which performed the update
  
**`connectionStatusUpdated`** &nbsp; bool  
  
A flag indicating whether the member's connection status has updated.
  
**`updatedMemberPropertyCount`** &nbsp; uint32_t  
  
The number of member properties which have been updated for ```member```.
  
**`updatedMemberPropertyKeys`** &nbsp; const char*  
*array of size `updatedMemberPropertyCount`*  
  
The keys of the member properties which have been updated for ```member```.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
