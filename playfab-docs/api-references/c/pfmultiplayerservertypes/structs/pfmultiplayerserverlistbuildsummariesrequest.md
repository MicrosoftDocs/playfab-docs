---
author: jasonsandlin
title: "PFMultiplayerServerListBuildSummariesRequest"
description: "PFMultiplayerServerListBuildSummariesRequest data model. Returns a list of summarized details of all multiplayer server builds for a title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListBuildSummariesRequest  

PFMultiplayerServerListBuildSummariesRequest data model. Returns a list of summarized details of all multiplayer server builds for a title.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListBuildSummariesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* pageSize;  
    const char* skipToken;  
} PFMultiplayerServerListBuildSummariesRequest;  
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
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
