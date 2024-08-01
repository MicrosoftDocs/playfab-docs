---
author: jasonsandlin
title: "PFCatalogReviewTakedown"
description: "PFCatalogReviewTakedown data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogReviewTakedown  

PFCatalogReviewTakedown data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogReviewTakedown {  
    PFCatalogCatalogAlternateId const* alternateId;  
    const char* itemId;  
    const char* reviewId;  
} PFCatalogReviewTakedown;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID associated with this item.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the item associated with the review to take down.
  
**`reviewId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the review to take down.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
