---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardAroundEntityRequest"
description: "PFLeaderboardsGetLeaderboardAroundEntityRequest data model. Request to load a section of a leaderboard centered on a specific entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardAroundEntityRequest  

PFLeaderboardsGetLeaderboardAroundEntityRequest data model. Request to load a section of a leaderboard centered on a specific entity.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsGetLeaderboardAroundEntityRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* leaderboardName;  
    uint32_t maxSurroundingEntries;  
    uint32_t const* version;  
} PFLeaderboardsGetLeaderboardAroundEntityRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`leaderboardName`** &nbsp; const char*  
*is null-terminated*  
  
Name of the leaderboard.
  
**`maxSurroundingEntries`** &nbsp; uint32_t  
  
Number of surrounding entries to return (in addition to specified entity). In general, the number of ranks above and below will be split into half. For example, if the specified value is 10, 5 ranks above and 5 ranks below will be retrieved. However, the numbers will get skewed in either direction when the specified entity is towards the top or bottom of the leaderboard. Also, the number of entries returned can be lower than the value specified for entries at the bottom of the leaderboard.
  
**`version`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Optional version of the leaderboard, defaults to current.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
