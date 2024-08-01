---
author: jasonsandlin
title: "PFCatalogGetDraftItemResponse"
description: "PFCatalogGetDraftItemResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetDraftItemResponse  

PFCatalogGetDraftItemResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetDraftItemResponse {  
    PFCatalogCatalogItem const* item;  
} PFCatalogGetDraftItemResponse;  
```
  
### Members  
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Full metadata of the catalog item requested.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
