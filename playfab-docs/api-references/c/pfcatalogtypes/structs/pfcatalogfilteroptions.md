---
author: jasonsandlin
title: "PFCatalogFilterOptions"
description: "PFCatalogFilterOptions data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFCatalogFilterOptions  

PFCatalogFilterOptions data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogFilterOptions {  
    const char* filter;  
    bool const* includeAllItems;  
} PFCatalogFilterOptions;  
```
  
### Members  
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The OData filter utilized. Mutually exclusive with 'IncludeAllItems'. More info about Filter Complexity limits can be found here: https://learn.microsoft.com/en-us/gaming/playfab/features/economy-v2/catalog/search#limits.
  
**`includeAllItems`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) The flag that overrides the filter and allows for returning all catalog items. Mutually exclusive with 'Filter'.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
