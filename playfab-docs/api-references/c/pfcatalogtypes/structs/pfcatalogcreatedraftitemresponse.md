---
author: jasonsandlin
title: "PFCatalogCreateDraftItemResponse"
description: "PFCatalogCreateDraftItemResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCreateDraftItemResponse  

PFCatalogCreateDraftItemResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCreateDraftItemResponse {  
    PFCatalogCatalogItem const* item;  
} PFCatalogCreateDraftItemResponse;  
```
  
### Members  
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Updated metadata describing the catalog item just created.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
