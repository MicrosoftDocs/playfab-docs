---
author: jasonsandlin
title: "PFLeaderboardsLinkedStatisticColumn"
description: "PFLeaderboardsLinkedStatisticColumn data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsLinkedStatisticColumn  

PFLeaderboardsLinkedStatisticColumn data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsLinkedStatisticColumn {  
    const char* linkedStatisticColumnName;  
    const char* linkedStatisticName;  
} PFLeaderboardsLinkedStatisticColumn;  
```
  
### Members  
  
**`linkedStatisticColumnName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the statistic column that this leaderboard column is sourced from.
  
**`linkedStatisticName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the statistic.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
