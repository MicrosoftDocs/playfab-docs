---
author: jasonsandlin
title: "PFCatalogStoreDetails"
description: "PFCatalogStoreDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFCatalogStoreDetails  

PFCatalogStoreDetails data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogStoreDetails {  
    PFCatalogFilterOptions const* filterOptions;  
    PFCatalogPermissions const* permissions;  
    PFCatalogCatalogPriceOptionsOverride const* priceOptionsOverride;  
} PFCatalogStoreDetails;  
```
  
### Members  
  
**`filterOptions`** &nbsp; [PFCatalogFilterOptions](pfcatalogfilteroptions.md) const*  
*may be nullptr*  
  
(Optional) The options for the filter in filter-based stores. These options are mutually exclusive with item references.
  
**`permissions`** &nbsp; [PFCatalogPermissions](pfcatalogpermissions.md) const*  
*may be nullptr*  
  
(Optional) The permissions that control which players can purchase from the store.
  
**`priceOptionsOverride`** &nbsp; [PFCatalogCatalogPriceOptionsOverride](pfcatalogcatalogpriceoptionsoverride.md) const*  
*may be nullptr*  
  
(Optional) The global prices utilized in the store. These options are mutually exclusive with price options in item references.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
