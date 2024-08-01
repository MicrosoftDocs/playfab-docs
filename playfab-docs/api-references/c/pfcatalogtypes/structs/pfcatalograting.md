---
author: jasonsandlin
title: "PFCatalogRating"
description: "PFCatalogRating data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogRating  

PFCatalogRating data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogRating {  
    float const* average;  
    int32_t const* count1Star;  
    int32_t const* count2Star;  
    int32_t const* count3Star;  
    int32_t const* count4Star;  
    int32_t const* count5Star;  
    int32_t const* totalCount;  
} PFCatalogRating;  
```
  
### Members  
  
**`average`** &nbsp; float const*  
*may be nullptr*  
  
(Optional) The average rating for this item.
  
**`count1Star`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The total count of 1 star ratings for this item.
  
**`count2Star`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The total count of 2 star ratings for this item.
  
**`count3Star`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The total count of 3 star ratings for this item.
  
**`count4Star`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The total count of 4 star ratings for this item.
  
**`count5Star`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The total count of 5 star ratings for this item.
  
**`totalCount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The total count of ratings for this item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
