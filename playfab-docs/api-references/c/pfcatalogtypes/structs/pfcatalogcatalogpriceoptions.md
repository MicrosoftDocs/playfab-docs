---
author: jasonsandlin
title: "PFCatalogCatalogPriceOptions"
description: "PFCatalogCatalogPriceOptions data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
*may be nullptr*  
  
(Optional) Prices of the catalog item. An item can have up to 15 prices.
  
**`pricesCount`** &nbsp; uint32_t  
  
Count of prices
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
