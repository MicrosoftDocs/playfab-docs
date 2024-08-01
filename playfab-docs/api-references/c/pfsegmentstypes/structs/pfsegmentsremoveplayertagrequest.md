---
author: jasonsandlin
title: "PFSegmentsRemovePlayerTagRequest"
description: "PFSegmentsRemovePlayerTagRequest data model. This API will trigger a player_tag_removed event and remove a tag with the given TagName and PlayFabID from the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsRemovePlayerTagRequest  

PFSegmentsRemovePlayerTagRequest data model. This API will trigger a player_tag_removed event and remove a tag with the given TagName and PlayFabID from the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters.  

## Syntax  
  
```cpp
typedef struct PFSegmentsRemovePlayerTagRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
    const char* tagName;  
} PFSegmentsRemovePlayerTagRequest;  
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
  
**`tagName`** &nbsp; const char*  
*is null-terminated*  
  
Unique tag for player profile.
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
