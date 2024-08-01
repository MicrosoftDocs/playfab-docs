---
author: jasonsandlin
title: "PFSegmentsGetPlayerTagsRequest"
description: "PFSegmentsGetPlayerTagsRequest data model. This API will return a list of canonical tags which includes both namespace and tag's name. If namespace is not provided, the result is a list of all canonical tags. TagName can be used for segmentation and Namespace is limited to 128 characters."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsGetPlayerTagsRequest  

PFSegmentsGetPlayerTagsRequest data model. This API will return a list of canonical tags which includes both namespace and tag's name. If namespace is not provided, the result is a list of all canonical tags. TagName can be used for segmentation and Namespace is limited to 128 characters.  

## Syntax  
  
```cpp
typedef struct PFSegmentsGetPlayerTagsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playfabNamespace;  
    const char* playFabId;  
} PFSegmentsGetPlayerTagsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`playfabNamespace`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional namespace to filter results by.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
