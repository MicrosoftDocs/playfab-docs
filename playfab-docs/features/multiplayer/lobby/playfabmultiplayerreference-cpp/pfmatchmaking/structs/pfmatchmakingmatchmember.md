---
author: ScottMunroMS
title: "PFMatchmakingMatchMember"
description: "A member of a match result."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMatchmakingMatchMember  

A member of a match result.  

## Syntax  
  
```cpp
struct PFMatchmakingMatchMember {  
    PFEntityKey entityKey;  
    const char* teamId;  
    const char* attributes;  
}  
```
  
### Members  
  
**`entityKey`** &nbsp; [PFEntityKey](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The Entity Key for this match member.
  
**`teamId`** &nbsp; const char*  
*is null-terminated*  
  
The team ID assigned to this match member.
  
May be empty if the matchmaking queue doesn't use team rules.
  
**`attributes`** &nbsp; const char*  
*is null-terminated*  
  
The attributes for this user in serialized JSON format.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
