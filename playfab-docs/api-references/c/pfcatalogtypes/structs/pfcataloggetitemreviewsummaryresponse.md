---
author: jasonsandlin
title: "PFCatalogGetItemReviewSummaryResponse"
description: "PFCatalogGetItemReviewSummaryResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemReviewSummaryResponse  

PFCatalogGetItemReviewSummaryResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemReviewSummaryResponse {  
    PFCatalogReview const* leastFavorableReview;  
    PFCatalogReview const* mostFavorableReview;  
    PFCatalogRating const* rating;  
    int32_t reviewsCount;  
} PFCatalogGetItemReviewSummaryResponse;  
```
  
### Members  
  
**`leastFavorableReview`** &nbsp; [PFCatalogReview](pfcatalogreview.md) const*  
*may be nullptr*  
  
(Optional) The least favorable review for this item.
  
**`mostFavorableReview`** &nbsp; [PFCatalogReview](pfcatalogreview.md) const*  
*may be nullptr*  
  
(Optional) The most favorable review for this item.
  
**`rating`** &nbsp; [PFCatalogRating](pfcatalograting.md) const*  
*may be nullptr*  
  
(Optional) The summary of ratings associated with this item.
  
**`reviewsCount`** &nbsp; int32_t  
  
The total number of reviews associated with this item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
