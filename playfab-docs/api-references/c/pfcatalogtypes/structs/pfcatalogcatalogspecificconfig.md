---
author: jasonsandlin
title: "PFCatalogCatalogSpecificConfig"
description: "PFCatalogCatalogSpecificConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogCatalogSpecificConfig  

PFCatalogCatalogSpecificConfig data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogSpecificConfig {  
    const char* const* contentTypes;  
    uint32_t contentTypesCount;  
    const char* const* tags;  
    uint32_t tagsCount;  
} PFCatalogCatalogSpecificConfig;  
```
  
### Members  
  
**`contentTypes`** &nbsp; const char* const*  
*array of size `contentTypesCount`*  
  
(Optional) The set of content types that will be used for validation.
  
**`contentTypesCount`** &nbsp; uint32_t  
  
Count of contentTypes
  
**`tags`** &nbsp; const char* const*  
*array of size `tagsCount`*  
  
(Optional) The set of tags that will be used for validation.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
