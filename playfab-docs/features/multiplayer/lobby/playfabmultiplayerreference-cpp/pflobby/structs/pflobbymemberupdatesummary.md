---
author: ScottMunroMS
title: "PFLobbyMemberUpdateSummary"
description: "A collection of hints about an update which has been successfully applied to the lobby on behalf of a member."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyMemberUpdateSummary  

A collection of hints about an update which has been successfully applied to the lobby on behalf of a member.  

## Syntax  
  
```cpp
struct PFLobbyMemberUpdateSummary {  
    PFEntityKey member;  
    bool connectionStatusUpdated;  
    uint32_t updatedMemberPropertyCount;  
    const char* const* updatedMemberPropertyKeys;  
}  
```
  
### Members  
  
**`member`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The member which performed the update
  
**`connectionStatusUpdated`** &nbsp; bool  
  
A flag indicating whether the member's connection status has updated.
  
**`updatedMemberPropertyCount`** &nbsp; uint32_t  
  
The number of member properties which have been updated for ```member```.
  
**`updatedMemberPropertyKeys`** &nbsp; const char* const*  
*array of size `updatedMemberPropertyCount`*  
  
The keys of the member properties which have been updated for ```member```.
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
