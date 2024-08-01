---
author: jasonsandlin
title: "PFSegmentsGetPlayersSegmentsRequest"
description: "PFSegmentsGetPlayersSegmentsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetPlayersSegmentsRequest  

PFSegmentsGetPlayersSegmentsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetPlayersSegmentsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
} PFSegmentsGetPlayersSegmentsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
