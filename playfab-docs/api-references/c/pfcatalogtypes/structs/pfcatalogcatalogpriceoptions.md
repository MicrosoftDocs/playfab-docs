---
author: jasonsandlin
title: "PFCatalogCatalogPriceOptions"
description: "PFCatalogCatalogPriceOptions data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogCatalogPriceOptions  

PFCatalogCatalogPriceOptions data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogPriceOptions {  
    PFCatalogCatalogPrice const* prices;  
    uint32_t pricesCount;  
} PFCatalogCatalogPriceOptions;  
```
  
### Members  
  
**`prices`** &nbsp; [PFCatalogCatalogPrice](pfcatalogcatalogprice.md) const*  
*array of size `pricesCount`*  
  
(Optional) Prices of the catalog item.
  
**`pricesCount`** &nbsp; uint32_t  
  
Count of prices
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
