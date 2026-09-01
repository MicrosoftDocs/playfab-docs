---
author: jasonsandlin
title: "PFLeaderboardsDeleteLeaderboardEntriesRequest"
description: "PFLeaderboardsDeleteLeaderboardEntriesRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsDeleteLeaderboardEntriesRequest  

PFLeaderboardsDeleteLeaderboardEntriesRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsDeleteLeaderboardEntriesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* const* entityIds;  
    uint32_t entityIdsCount;  
    const char* name;  
} PFLeaderboardsDeleteLeaderboardEntriesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entityIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The unique Ids of the entries to delete from the leaderboard.
  
**`entityIdsCount`** &nbsp; uint32_t  
  
Count of entityIds
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of the leaderboard.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
