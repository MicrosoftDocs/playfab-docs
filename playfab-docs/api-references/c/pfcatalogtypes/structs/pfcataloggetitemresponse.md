---
author: jasonsandlin
title: "PFCatalogGetItemResponse"
description: "PFCatalogGetItemResponse data model. Get item result."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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

  
  
