---
author: jasonsandlin
title: "PFMultiplayerServerListBuildAliasesRequest"
description: "Request object for PFMultiplayerServerListBuildAliasesAsync, which lists details of all build aliases for a title."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PFMultiplayerServerListBuildAliasesRequest  

Request object for [PFMultiplayerServerListBuildAliasesAsync](../../pfmultiplayerserver/functions/pfmultiplayerserverlistbuildaliasesasync.md), which lists details of all build aliases for a title.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerListBuildAliasesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* pageSize;  
    const char* skipToken;  
} PFMultiplayerServerListBuildAliasesRequest;  
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
*may be nullptr*  
*is null-terminated*  
  
(Optional) The skip token for the paged request.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
