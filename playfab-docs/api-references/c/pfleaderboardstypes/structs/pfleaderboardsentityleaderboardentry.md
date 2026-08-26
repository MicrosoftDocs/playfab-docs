---
author: jasonsandlin
title: "PFLeaderboardsEntityLeaderboardEntry"
description: "PFLeaderboardsEntityLeaderboardEntry data model. Individual rank of an entity in a leaderboard."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsEntityLeaderboardEntry  

PFLeaderboardsEntityLeaderboardEntry data model. Individual rank of an entity in a leaderboard.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsEntityLeaderboardEntry {  
    const char* displayName;  
    PFEntityKey const* entity;  
    time_t lastUpdated;  
    const char* metadata;  
    int32_t rank;  
    const char* const* scores;  
    uint32_t scoresCount;  
} PFLeaderboardsEntityLeaderboardEntry;  
```
  
### Members  
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Entity's display name.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) Entity identifier.
  
**`lastUpdated`** &nbsp; time_t  
  
The time at which the last update to the entry was recorded on the server.
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque blob of data stored on the leaderboard entry. Note that the metadata is not used for ranking purposes.
  
**`rank`** &nbsp; int32_t  
  
Position on the leaderboard.
  
**`scores`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Scores for the entry.
  
**`scoresCount`** &nbsp; uint32_t  
  
Count of scores
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
