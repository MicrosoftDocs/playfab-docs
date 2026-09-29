---
author: jasonsandlin
title: "PFCatalogTakedownItemReviewsRequest"
description: "PFCatalogTakedownItemReviewsRequest data model. Submit a request to takedown one or more reviews, removing them from public view. Authors will still be able to see their reviews after being taken down."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogTakedownItemReviewsRequest  

PFCatalogTakedownItemReviewsRequest data model. Submit a request to takedown one or more reviews, removing them from public view. Authors will still be able to see their reviews after being taken down.  

## Syntax  
  
```cpp
typedef struct PFCatalogTakedownItemReviewsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFCatalogReviewTakedown const* reviews;  
    uint32_t reviewsCount;  
} PFCatalogTakedownItemReviewsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`reviews`** &nbsp; [PFCatalogReviewTakedown](pfcatalogreviewtakedown.md) const*  
*may be nullptr*  
  
(Optional) The set of reviews to take down.
  
**`reviewsCount`** &nbsp; uint32_t  
  
Count of reviews
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
