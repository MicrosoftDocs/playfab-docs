---
author: jasonsandlin
title: "PFLeaderboardsUpdateLeaderboardEntriesRequest"
description: "PFLeaderboardsUpdateLeaderboardEntriesRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsUpdateLeaderboardEntriesRequest  

PFLeaderboardsUpdateLeaderboardEntriesRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsUpdateLeaderboardEntriesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFLeaderboardsLeaderboardEntryUpdate const* entries;  
    uint32_t entriesCount;  
    const char* leaderboardName;  
} PFLeaderboardsUpdateLeaderboardEntriesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entries`** &nbsp; [PFLeaderboardsLeaderboardEntryUpdate](pfleaderboardsleaderboardentryupdate.md) const*  
*may be nullptr*  
  
(Optional) The entries to add or update on the leaderboard.
  
**`entriesCount`** &nbsp; uint32_t  
  
Count of entries
  
**`leaderboardName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the leaderboard.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
