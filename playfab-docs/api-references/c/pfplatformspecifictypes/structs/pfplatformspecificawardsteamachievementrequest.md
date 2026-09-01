---
author: jasonsandlin
title: "PFPlatformSpecificAwardSteamAchievementRequest"
description: "PFPlatformSpecificAwardSteamAchievementRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificAwardSteamAchievementRequest  

PFPlatformSpecificAwardSteamAchievementRequest data model.  

## Syntax  
  
```cpp
typedef struct PFPlatformSpecificAwardSteamAchievementRequest {  
    PFPlatformSpecificAwardSteamAchievementItem const* achievements;  
    uint32_t achievementsCount;  
} PFPlatformSpecificAwardSteamAchievementRequest;  
```
  
### Members  
  
**`achievements`** &nbsp; [PFPlatformSpecificAwardSteamAchievementItem](pfplatformspecificawardsteamachievementitem.md) const*  
  
Array of achievements to grant and the users to whom they are to be granted.
  
**`achievementsCount`** &nbsp; uint32_t  
  
Count of achievements
  
  
## Requirements  
  
**Header:** PFPlatformSpecificTypes.h
  
## See also  
[PFPlatformSpecificTypes members](../pfplatformspecifictypes_members.md)  

  
  
