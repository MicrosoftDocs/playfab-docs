---
author: jasonsandlin
title: "PFLeaderboardsLeaderboardEventEmissionConfig"
description: "PFLeaderboardsLeaderboardEventEmissionConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsLeaderboardEventEmissionConfig  

PFLeaderboardsLeaderboardEventEmissionConfig data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsLeaderboardEventEmissionConfig {  
    PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig const* entityRankOnVersionEndConfig;  
    PFLeaderboardsLeaderboardVersionEndConfig const* versionEndConfig;  
} PFLeaderboardsLeaderboardEventEmissionConfig;  
```
  
### Members  
  
**`entityRankOnVersionEndConfig`** &nbsp; [PFLeaderboardsLeaderboardEntityRankOnVersionEndConfig](pfleaderboardsleaderboardentityrankonversionendconfig.md) const*  
*may be nullptr*  
  
(Optional) This event emits the top ranks of the leaderboard when the leaderboard version end.
  
**`versionEndConfig`** &nbsp; [PFLeaderboardsLeaderboardVersionEndConfig](pfleaderboardsleaderboardversionendconfig.md) const*  
*may be nullptr*  
  
(Optional) This event is emitted when the leaderboard version end.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
