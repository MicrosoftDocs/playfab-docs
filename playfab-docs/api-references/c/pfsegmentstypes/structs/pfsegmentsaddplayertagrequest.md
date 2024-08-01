---
author: jasonsandlin
title: "PFSegmentsAddPlayerTagRequest"
description: "PFSegmentsAddPlayerTagRequest data model. This API will trigger a player_tag_added event and add a tag with the given TagName and PlayFabID to the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. Also there is a limit on the number of tags a title can have."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsAddPlayerTagRequest  

PFSegmentsAddPlayerTagRequest data model. This API will trigger a player_tag_added event and add a tag with the given TagName and PlayFabID to the corresponding player profile. TagName can be used for segmentation and it is limited to 256 characters. Also there is a limit on the number of tags a title can have.  

## Syntax  
  
```cpp
typedef struct PFSegmentsAddPlayerTagRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
    const char* tagName;  
} PFSegmentsAddPlayerTagRequest;  
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

  
  
