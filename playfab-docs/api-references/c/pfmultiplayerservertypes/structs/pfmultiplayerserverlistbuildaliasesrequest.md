---
author: jasonsandlin
title: "PFMultiplayerServerListBuildAliasesRequest"
description: "PFMultiplayerServerListBuildAliasesRequest data model. Returns a list of summarized details of all multiplayer server builds for a title."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerListBuildAliasesRequest  

PFMultiplayerServerListBuildAliasesRequest data model. Returns a list of summarized details of all multiplayer server builds for a title.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListBuildAliasesRequest {  
    uint32_t customTagsCount;  
    int32_t const* pageSize;  
    const char* skipToken;  
} PFMultiplayerServerListBuildAliasesRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
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

  
  
