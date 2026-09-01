---
author: jasonsandlin
title: "PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig"
description: "PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig  

PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig {  
    PFEventType eventType;  
    int32_t rankLimit;  
} PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig;  
```
  
### Members  
  
**`eventType`** &nbsp; [PFEventType](../../pftypes/enums/pfeventtype.md)  
  
The type of event to emit when the leaderboard version end.
  
**`rankLimit`** &nbsp; int32_t  
  
The maximum number of entity to return on leaderboard version end. Range is 1 to 1000.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
