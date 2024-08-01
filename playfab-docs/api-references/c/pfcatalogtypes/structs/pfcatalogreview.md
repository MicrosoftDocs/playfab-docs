---
author: jasonsandlin
title: "PFCatalogReview"
description: "PFCatalogReview data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogReview  

PFCatalogReview data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogReview {  
    int32_t helpfulNegative;  
    int32_t helpfulPositive;  
    bool isInstalled;  
    const char* itemId;  
    const char* itemVersion;  
    const char* locale;  
    int32_t rating;  
    PFEntityKey const* reviewerEntity;  
    const char* reviewerId;  
    const char* reviewId;  
    const char* reviewText;  
    time_t submitted;  
    const char* title;  
} PFCatalogReview;  
```
  
### Members  
  
**`helpfulNegative`** &nbsp; int32_t  
  
The number of negative helpfulness votes for this review.
  
**`helpfulPositive`** &nbsp; int32_t  
  
The number of positive helpfulness votes for this review.
  
**`isInstalled`** &nbsp; bool  
  
Indicates whether the review author has the item installed.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the item being reviewed.
  
**`itemVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The version of the item being reviewed.
  
**`locale`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The locale for which this review was submitted in.
  
**`rating`** &nbsp; int32_t  
  
Star rating associated with this review.
  
**`reviewerEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The ID of the author of the review.
  
**`reviewerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Deprecated. Use ReviewerEntity instead. This property will be removed in a future release.
  
**`reviewId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the review.
  
**`reviewText`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The full text of this review.
  
**`submitted`** &nbsp; time_t  
  
The date and time this review was last submitted.
  
**`title`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The title of this review.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
