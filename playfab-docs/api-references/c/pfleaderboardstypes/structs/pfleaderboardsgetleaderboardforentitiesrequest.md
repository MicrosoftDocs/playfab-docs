---
author: jasonsandlin
title: "PFLeaderboardsGetLeaderboardForEntitiesRequest"
description: "PFLeaderboardsGetLeaderboardForEntitiesRequest data model. Request a leaderboard limited to a collection of entities."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetLeaderboardForEntitiesRequest  

PFLeaderboardsGetLeaderboardForEntitiesRequest data model. Request a leaderboard limited to a collection of entities.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsGetLeaderboardForEntitiesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* const* entityIds;  
    uint32_t entityIdsCount;  
    const char* leaderboardName;  
    uint32_t const* version;  
} PFLeaderboardsGetLeaderboardForEntitiesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entityIds`** &nbsp; const char* const*  
  
Collection of Entity IDs to include in the leaderboard.
  
**`entityIdsCount`** &nbsp; uint32_t  
  
Count of entityIds
  
**`leaderboardName`** &nbsp; const char*  
*is null-terminated*  
  
Name of the leaderboard.
  
**`version`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Optional version of the leaderboard, defaults to current.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
