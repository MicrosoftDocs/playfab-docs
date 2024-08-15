---
author: jasonsandlin
title: "PFCatalogSearchItemsResponse"
description: "PFCatalogSearchItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogSearchItemsResponse  

PFCatalogSearchItemsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogSearchItemsResponse {  
    const char* continuationToken;  
    PFCatalogCatalogItem const* items;  
    uint32_t itemsCount;  
} PFCatalogSearchItemsResponse;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
**`items`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) The paginated set of results for the search query.
  
**`itemsCount`** &nbsp; uint32_t  
  
Count of items
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
