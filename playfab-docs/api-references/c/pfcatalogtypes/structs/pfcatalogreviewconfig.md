---
author: jasonsandlin
title: "PFCatalogReviewConfig"
description: "PFCatalogReviewConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFCatalogReviewConfig  

PFCatalogReviewConfig data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogReviewConfig {  
    PFCatalogCategoryRatingConfig const* categoryRatings;  
    uint32_t categoryRatingsCount;  
} PFCatalogReviewConfig;  
```
  
### Members  
  
**`categoryRatings`** &nbsp; [PFCatalogCategoryRatingConfig](pfcatalogcategoryratingconfig.md) const*  
*may be nullptr*  
  
(Optional) A set of categories that can be applied toward ratings and reviews.
  
**`categoryRatingsCount`** &nbsp; uint32_t  
  
Count of categoryRatings
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
