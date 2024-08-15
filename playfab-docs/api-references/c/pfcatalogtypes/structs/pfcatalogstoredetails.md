---
author: jasonsandlin
title: "PFCatalogStoreDetails"
description: "PFCatalogStoreDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogStoreDetails  

PFCatalogStoreDetails data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogStoreDetails {  
    PFCatalogFilterOptions const* filterOptions;  
    PFCatalogCatalogPriceOptionsOverride const* priceOptionsOverride;  
} PFCatalogStoreDetails;  
```
  
### Members  
  
**`filterOptions`** &nbsp; [PFCatalogFilterOptions](pfcatalogfilteroptions.md) const*  
*may be nullptr*  
  
(Optional) The options for the filter in filter-based stores. These options are mutually exclusive with item references.
  
**`priceOptionsOverride`** &nbsp; [PFCatalogCatalogPriceOptionsOverride](pfcatalogcatalogpriceoptionsoverride.md) const*  
*may be nullptr*  
  
(Optional) The global prices utilized in the store. These options are mutually exclusive with price options in item references.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
