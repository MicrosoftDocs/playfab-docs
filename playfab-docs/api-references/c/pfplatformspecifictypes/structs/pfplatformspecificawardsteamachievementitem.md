---
author: jasonsandlin
title: "PFPlatformSpecificAwardSteamAchievementItem"
description: "PFPlatformSpecificAwardSteamAchievementItem data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFPlatformSpecificAwardSteamAchievementItem  

PFPlatformSpecificAwardSteamAchievementItem data model.  

## Syntax  
  
```cpp
typedef struct PFPlatformSpecificAwardSteamAchievementItem {  
    const char* achievementName;  
    const char* playFabId;  
    bool result;  
} PFPlatformSpecificAwardSteamAchievementItem;  
```
  
### Members  
  
**`achievementName`** &nbsp; const char*  
*is null-terminated*  
  
Unique Steam achievement name.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`result`** &nbsp; bool  
  
Result of the award attempt (only valid on response, not on request).
  
  
## Requirements  
  
**Header:** PFPlatformSpecificTypes.h
  
## See also  
[PFPlatformSpecificTypes members](../pfplatformspecifictypes_members.md)  

  
  
