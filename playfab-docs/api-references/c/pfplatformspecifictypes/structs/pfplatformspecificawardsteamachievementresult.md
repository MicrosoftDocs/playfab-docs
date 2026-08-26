---
author: jasonsandlin
title: "PFPlatformSpecificAwardSteamAchievementResult"
description: "PFPlatformSpecificAwardSteamAchievementResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificAwardSteamAchievementResult  

PFPlatformSpecificAwardSteamAchievementResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlatformSpecificAwardSteamAchievementResult {  
    PFPlatformSpecificAwardSteamAchievementItem const* achievementResults;  
    uint32_t achievementResultsCount;  
} PFPlatformSpecificAwardSteamAchievementResult;  
```
  
### Members  
  
**`achievementResults`** &nbsp; [PFPlatformSpecificAwardSteamAchievementItem](pfplatformspecificawardsteamachievementitem.md) const*  
*may be nullptr*  
  
(Optional) Array of achievements granted.
  
**`achievementResultsCount`** &nbsp; uint32_t  
  
Count of achievementResults
  
  
## Requirements  
  
**Header:** PFPlatformSpecificTypes.h
  
## See also  
[PFPlatformSpecificTypes members](../pfplatformspecifictypes_members.md)  

  
  
