---
author: jasonsandlin
title: "PFLeaderboardsListLeaderboardDefinitionsResponse"
description: "PFLeaderboardsListLeaderboardDefinitionsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsListLeaderboardDefinitionsResponse  

PFLeaderboardsListLeaderboardDefinitionsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsListLeaderboardDefinitionsResponse {  
    PFLeaderboardsLeaderboardDefinition const* leaderboardDefinitions;  
    uint32_t leaderboardDefinitionsCount;  
    int32_t pageSize;  
    const char* skipToken;  
} PFLeaderboardsListLeaderboardDefinitionsResponse;  
```
  
### Members  
  
**`leaderboardDefinitions`** &nbsp; [PFLeaderboardsLeaderboardDefinition](pfleaderboardsleaderboarddefinition.md) const*  
*may be nullptr*  
  
(Optional) List of leaderboard definitions for the title.
  
**`leaderboardDefinitionsCount`** &nbsp; uint32_t  
  
Count of leaderboardDefinitions
  
**`pageSize`** &nbsp; int32_t  
  
The page size on the response.
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged response.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
