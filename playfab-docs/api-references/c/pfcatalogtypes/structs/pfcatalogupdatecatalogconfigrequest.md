---
author: jasonsandlin
title: "PFCatalogUpdateCatalogConfigRequest"
description: "PFCatalogUpdateCatalogConfigRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogUpdateCatalogConfigRequest  

PFCatalogUpdateCatalogConfigRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogUpdateCatalogConfigRequest {  
    PFCatalogCatalogConfig const* config;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFCatalogUpdateCatalogConfigRequest;  
```
  
### Members  
  
**`config`** &nbsp; [PFCatalogCatalogConfig](pfcatalogcatalogconfig.md) const*  
*may be nullptr*  
  
(Optional) The updated catalog configuration.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
