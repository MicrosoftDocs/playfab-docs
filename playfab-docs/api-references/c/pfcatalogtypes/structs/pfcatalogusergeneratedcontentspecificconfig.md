---
author: jasonsandlin
title: "PFCatalogUserGeneratedContentSpecificConfig"
description: "PFCatalogUserGeneratedContentSpecificConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogUserGeneratedContentSpecificConfig  

PFCatalogUserGeneratedContentSpecificConfig data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogUserGeneratedContentSpecificConfig {  
    const char* const* contentTypes;  
    uint32_t contentTypesCount;  
    const char* const* tags;  
    uint32_t tagsCount;  
} PFCatalogUserGeneratedContentSpecificConfig;  
```
  
### Members  
  
**`contentTypes`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The set of content types that will be used for validation.
  
**`contentTypesCount`** &nbsp; uint32_t  
  
Count of contentTypes
  
**`tags`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The set of tags that will be used for validation.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
