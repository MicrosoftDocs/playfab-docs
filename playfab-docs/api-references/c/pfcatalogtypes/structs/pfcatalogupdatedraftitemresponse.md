---
author: jasonsandlin
title: "PFCatalogUpdateDraftItemResponse"
description: "PFCatalogUpdateDraftItemResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogUpdateDraftItemResponse  

PFCatalogUpdateDraftItemResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogUpdateDraftItemResponse {  
    PFCatalogCatalogItem const* item;  
} PFCatalogUpdateDraftItemResponse;  
```
  
### Members  
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Updated metadata describing the catalog item just updated.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
