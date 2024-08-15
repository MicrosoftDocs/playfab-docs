---
author: jasonsandlin
title: "PFCatalogCatalogItemReference"
description: "PFCatalogCatalogItemReference data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCatalogItemReference  

PFCatalogCatalogItemReference data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogItemReference {  
    int32_t const* amount;  
    const char* id;  
    PFCatalogCatalogPriceOptions const* priceOptions;  
} PFCatalogCatalogItemReference;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount of the catalog item.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the catalog item.
  
**`priceOptions`** &nbsp; [PFCatalogCatalogPriceOptions](pfcatalogcatalogpriceoptions.md) const*  
*may be nullptr*  
  
(Optional) The prices the catalog item can be purchased for.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
