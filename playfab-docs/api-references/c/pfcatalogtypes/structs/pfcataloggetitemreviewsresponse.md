---
author: jasonsandlin
title: "PFCatalogGetItemReviewsResponse"
description: "PFCatalogGetItemReviewsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemReviewsResponse  

PFCatalogGetItemReviewsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemReviewsResponse {  
    const char* continuationToken;  
    PFCatalogReview const* reviews;  
    uint32_t reviewsCount;  
} PFCatalogGetItemReviewsResponse;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
**`reviews`** &nbsp; [PFCatalogReview](pfcatalogreview.md) const*  
*may be nullptr*  
  
(Optional) The paginated set of results.
  
**`reviewsCount`** &nbsp; uint32_t  
  
Count of reviews
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
