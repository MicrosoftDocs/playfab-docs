---
author: jasonsandlin
title: "PFCatalogGetItemReviewSummaryRequest"
description: "PFCatalogGetItemReviewSummaryRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemReviewSummaryRequest  

PFCatalogGetItemReviewSummaryRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemReviewSummaryRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    uint32_t customTagsCount;  
    const char* id;  
} PFCatalogGetItemReviewSummaryRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID associated with this item.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
