---
author: jasonsandlin
title: "PFCatalogKeywordSet"
description: "PFCatalogKeywordSet data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogKeywordSet  

PFCatalogKeywordSet data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogKeywordSet {  
    const char* const* values;  
    uint32_t valuesCount;  
} PFCatalogKeywordSet;  
```
  
### Members  
  
**`values`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) A list of localized keywords.
  
**`valuesCount`** &nbsp; uint32_t  
  
Count of values
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
