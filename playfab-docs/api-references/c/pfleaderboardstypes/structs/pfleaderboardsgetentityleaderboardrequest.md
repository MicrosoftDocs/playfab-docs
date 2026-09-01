---
author: jasonsandlin
title: "PFLeaderboardsGetEntityLeaderboardRequest"
description: "PFLeaderboardsGetEntityLeaderboardRequest data model. Request to load a leaderboard."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetEntityLeaderboardRequest  

PFLeaderboardsGetEntityLeaderboardRequest data model. Request to load a leaderboard.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsGetEntityLeaderboardRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* leaderboardName;  
    uint32_t pageSize;  
    uint32_t const* startingPosition;  
    uint32_t const* version;  
} PFLeaderboardsGetEntityLeaderboardRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`leaderboardName`** &nbsp; const char*  
*is null-terminated*  
  
Name of the leaderboard.
  
**`pageSize`** &nbsp; uint32_t  
  
Maximum number of results to return from the leaderboard. Minimum 1, maximum 100.
  
**`startingPosition`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Index position to start from. 1 is beginning of leaderboard. .
  
**`version`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Optional version of the leaderboard, defaults to current version.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
