---
author: jasonsandlin
title: "PFLeaderboardsListLeaderboardDefinitionsRequest"
description: "PFLeaderboardsListLeaderboardDefinitionsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsListLeaderboardDefinitionsRequest  

PFLeaderboardsListLeaderboardDefinitionsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsListLeaderboardDefinitionsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* pageSize;  
    const char* skipToken;  
} PFLeaderboardsListLeaderboardDefinitionsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`pageSize`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The page size for the request.
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged request.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
