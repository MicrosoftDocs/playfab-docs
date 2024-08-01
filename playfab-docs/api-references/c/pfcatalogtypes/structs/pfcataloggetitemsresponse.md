---
author: jasonsandlin
title: "PFCatalogGetItemsResponse"
description: "PFCatalogGetItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemsResponse  

PFCatalogGetItemsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemsResponse {  
    PFCatalogCatalogItem const* items;  
    uint32_t itemsCount;  
} PFCatalogGetItemsResponse;  
```
  
### Members  
  
**`items`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Metadata of set of items.
  
**`itemsCount`** &nbsp; uint32_t  
  
Count of items
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
