---
author: jasonsandlin
title: "PFCatalogImageConfig"
description: "PFCatalogImageConfig data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogImageConfig  

PFCatalogImageConfig data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogImageConfig {  
    const char* const* tags;  
    uint32_t tagsCount;  
} PFCatalogImageConfig;  
```
  
### Members  
  
**`tags`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The set of tags that will be used for validation. Each tag can have a maximum character length of 32 and up to 1024 tags can be listed.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
