---
author: jasonsandlin
title: "PFLeaderboardsGetEntityLeaderboardResponse"
description: "PFLeaderboardsGetEntityLeaderboardResponse data model. Leaderboard response."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetEntityLeaderboardResponse  

PFLeaderboardsGetEntityLeaderboardResponse data model. Leaderboard response.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsGetEntityLeaderboardResponse {  
    PFLeaderboardsLeaderboardColumn const* columns;  
    uint32_t columnsCount;  
    uint32_t entryCount;  
    time_t const* nextReset;  
    PFLeaderboardsEntityLeaderboardEntry const* rankings;  
    uint32_t rankingsCount;  
    uint32_t version;  
} PFLeaderboardsGetEntityLeaderboardResponse;  
```
  
### Members  
  
**`columns`** &nbsp; [PFLeaderboardsLeaderboardColumn](pfleaderboardsleaderboardcolumn.md) const*  
*may be nullptr*  
  
(Optional) Leaderboard columns describing the sort directions.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
**`entryCount`** &nbsp; uint32_t  
  
The number of entries on the leaderboard.
  
**`nextReset`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time the next scheduled reset will occur. Null if the leaderboard does not reset on a schedule.
  
**`rankings`** &nbsp; [PFLeaderboardsEntityLeaderboardEntry](pfleaderboardsentityleaderboardentry.md) const*  
*may be nullptr*  
  
(Optional) Individual entity rankings in the leaderboard, in sorted order by rank.
  
**`rankingsCount`** &nbsp; uint32_t  
  
Count of rankings
  
**`version`** &nbsp; uint32_t  
  
Version of the leaderboard being returned.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
