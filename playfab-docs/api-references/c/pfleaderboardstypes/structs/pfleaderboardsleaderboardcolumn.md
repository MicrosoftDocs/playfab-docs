---
author: jasonsandlin
title: "PFLeaderboardsLeaderboardColumn"
description: "PFLeaderboardsLeaderboardColumn data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsLeaderboardColumn  

PFLeaderboardsLeaderboardColumn data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsLeaderboardColumn {  
    PFLeaderboardsLinkedStatisticColumn const* linkedStatisticColumn;  
    const char* name;  
    PFLeaderboardsLeaderboardSortDirection sortDirection;  
} PFLeaderboardsLeaderboardColumn;  
```
  
### Members  
  
**`linkedStatisticColumn`** &nbsp; [PFLeaderboardsLinkedStatisticColumn](pfleaderboardslinkedstatisticcolumn.md) const*  
*may be nullptr*  
  
(Optional) If the value for this column is sourced from a statistic, details of the linked column. Null if the leaderboard is not linked.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
A name for the leaderboard column, unique per leaderboard definition.
  
**`sortDirection`** &nbsp; [PFLeaderboardsLeaderboardSortDirection](../enums/pfleaderboardsleaderboardsortdirection.md)  
  
The sort direction for this column.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
