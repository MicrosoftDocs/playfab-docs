---
author: jasonsandlin
title: "PFCatalogGetItemResponse"
description: "PFCatalogGetItemResponse data model. Get item result."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemResponse  

PFCatalogGetItemResponse data model. Get item result.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemResponse {  
    PFCatalogCatalogItem const* item;  
} PFCatalogGetItemResponse;  
```
  
### Members  
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) The item result.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
