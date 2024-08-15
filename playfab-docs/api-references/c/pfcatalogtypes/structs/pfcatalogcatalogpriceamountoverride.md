---
author: jasonsandlin
title: "PFCatalogCatalogPriceAmountOverride"
description: "PFCatalogCatalogPriceAmountOverride data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCatalogPriceAmountOverride  

PFCatalogCatalogPriceAmountOverride data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogPriceAmountOverride {  
    int32_t const* fixedValue;  
    const char* itemId;  
    double const* multiplier;  
} PFCatalogCatalogPriceAmountOverride;  
```
  
### Members  
  
**`fixedValue`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The exact value that should be utilized in the override.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the item this override should utilize.
  
**`multiplier`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The multiplier that will be applied to the base Catalog value to determine what value should be utilized in the override.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
