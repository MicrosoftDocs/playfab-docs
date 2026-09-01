---
author: jasonsandlin
title: "PFLeaderboardsLeaderboardEntryUpdate"
description: "PFLeaderboardsLeaderboardEntryUpdate data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsLeaderboardEntryUpdate  

PFLeaderboardsLeaderboardEntryUpdate data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsLeaderboardEntryUpdate {  
    const char* entityId;  
    const char* metadata;  
    const char* const* scores;  
    uint32_t scoresCount;  
} PFLeaderboardsLeaderboardEntryUpdate;  
```
  
### Members  
  
**`entityId`** &nbsp; const char*  
*is null-terminated*  
  
The unique Id for the entry. If using PlayFab Entities, this would be the entityId of the entity.
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Arbitrary metadata to store along side the leaderboard entry, will be returned by all Leaderboard APIs.
  
**`scores`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The scores for the leaderboard. The number of values provided here must match the number of columns in the Leaderboard definition.
  
**`scoresCount`** &nbsp; uint32_t  
  
Count of scores
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
