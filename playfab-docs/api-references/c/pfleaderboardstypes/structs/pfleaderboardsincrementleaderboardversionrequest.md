---
author: jasonsandlin
title: "PFLeaderboardsIncrementLeaderboardVersionRequest"
description: "PFLeaderboardsIncrementLeaderboardVersionRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsIncrementLeaderboardVersionRequest  

PFLeaderboardsIncrementLeaderboardVersionRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsIncrementLeaderboardVersionRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* name;  
} PFLeaderboardsIncrementLeaderboardVersionRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
The name of the leaderboard to increment the version for.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
