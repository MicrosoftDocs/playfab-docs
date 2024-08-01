---
author: jasonsandlin
title: "PFCatalogCatalogPriceOverride"
description: "PFCatalogCatalogPriceOverride data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCatalogPriceOverride  

PFCatalogCatalogPriceOverride data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogPriceOverride {  
    PFCatalogCatalogPriceAmountOverride const* amounts;  
    uint32_t amountsCount;  
} PFCatalogCatalogPriceOverride;  
```
  
### Members  
  
**`amounts`** &nbsp; [PFCatalogCatalogPriceAmountOverride](pfcatalogcatalogpriceamountoverride.md) const*  
*may be nullptr*  
  
(Optional) The currency amounts utilized in the override for a singular price.
  
**`amountsCount`** &nbsp; uint32_t  
  
Count of amounts
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
