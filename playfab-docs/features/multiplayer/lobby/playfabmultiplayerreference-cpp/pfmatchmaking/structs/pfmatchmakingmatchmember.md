---
author: ScottMunroMS
title: "PFMatchmakingMatchMember"
description: "A member of a match result."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFMatchmakingMatchMember  

A member of a match result.  

## Syntax  
  
```cpp
typedef struct PFMatchmakingMatchMember {  
    PFEntityKey entityKey;  
    const char* teamId;  
    const char* attributes;  
} PFMatchmakingMatchMember  
```
  
### Members  
  
**`entityKey`** &nbsp; PFEntityKey  
  
The Entity Key for this match member.
  
**`teamId`** &nbsp; const char*  
*_Null_terminated_*  
  
The team ID assigned to this match member.
  
May be empty if the matchmaking queue doesn't use team rules.
  
**`attributes`** &nbsp; const char*  
*_Null_terminated_*  
  
The attributes for this user in serialized JSON format.
  
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  

  
  
