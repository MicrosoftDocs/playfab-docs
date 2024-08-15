---
author: jasonsandlin
title: "PFCatalogFileConfig"
description: "PFCatalogFileConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogFileConfig  

PFCatalogFileConfig data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogFileConfig {  
    const char* const* contentTypes;  
    uint32_t contentTypesCount;  
    const char* const* tags;  
    uint32_t tagsCount;  
} PFCatalogFileConfig;  
```
  
### Members  
  
**`contentTypes`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The set of content types that will be used for validation. Each content type can have a maximum character length of 40 and up to 128 types can be listed.
  
**`contentTypesCount`** &nbsp; uint32_t  
  
Count of contentTypes
  
**`tags`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The set of tags that will be used for validation. Each tag can have a maximum character length of 32 and up to 1024 tags can be listed.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
