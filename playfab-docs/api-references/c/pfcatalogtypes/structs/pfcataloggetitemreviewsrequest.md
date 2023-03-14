---
author: jasonsandlin
title: "PFCatalogGetItemReviewsRequest"
description: "PFCatalogGetItemReviewsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemReviewsRequest  

PFCatalogGetItemReviewsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemReviewsRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    const char* continuationToken;  
    int32_t count;  
    uint32_t customTagsCount;  
    const char* id;  
    const char* orderBy;  
} PFCatalogGetItemReviewsRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID associated with this item.
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. Maximum page size is 200. If not specified, defaults to 10.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the item.
  
**`orderBy`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData orderBy used to order the results of the query.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
