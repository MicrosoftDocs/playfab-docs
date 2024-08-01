---
author: jasonsandlin
title: "PFCatalogGetEntityDraftItemsResponse"
description: "PFCatalogGetEntityDraftItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetEntityDraftItemsResponse  

PFCatalogGetEntityDraftItemsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetEntityDraftItemsResponse {  
    const char* continuationToken;  
    PFCatalogCatalogItem const* items;  
    uint32_t itemsCount;  
} PFCatalogGetEntityDraftItemsResponse;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
**`items`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) A set of items created by the entity.
  
**`itemsCount`** &nbsp; uint32_t  
  
Count of items
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
