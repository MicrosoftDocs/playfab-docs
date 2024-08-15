---
author: jasonsandlin
title: "PFSegmentsGetPlayerTagsResult"
description: "PFSegmentsGetPlayerTagsResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetPlayerTagsResult  

PFSegmentsGetPlayerTagsResult data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetPlayerTagsResult {  
    const char* playFabId;  
    const char* const* tags;  
    uint32_t tagsCount;  
} PFSegmentsGetPlayerTagsResult;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`tags`** &nbsp; const char* const*  
  
Canonical tags (including namespace and tag's name) for the requested user.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
