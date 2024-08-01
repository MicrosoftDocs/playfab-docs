---
author: jasonsandlin
title: "PFCatalogContent"
description: "PFCatalogContent data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogContent  

PFCatalogContent data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogContent {  
    const char* id;  
    const char* maxClientVersion;  
    const char* minClientVersion;  
    const char* const* tags;  
    uint32_t tagsCount;  
    const char* type;  
    const char* url;  
} PFCatalogContent;  
```
  
### Members  
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The content unique ID.
  
**`maxClientVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The maximum client version that this content is compatible with. Client Versions can be up to 3 segments separated by periods(.) and each segment can have a maximum value of 65535.
  
**`minClientVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The minimum client version that this content is compatible with. Client Versions can be up to 3 segments separated by periods(.) and each segment can have a maximum value of 65535.
  
**`tags`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of tags that are associated with this content. Tags must be defined in the Catalog Config before being used in content.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The client-defined type of the content. Content Types must be defined in the Catalog Config before being used.
  
**`url`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Azure CDN URL for retrieval of the catalog item binary content.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
