---
author: jasonsandlin
title: "PFCatalogContent"
description: "PFCatalogContent data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
(Optional) The maximum client version that this content is compatible with.
  
**`minClientVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The minimum client version that this content is compatible with.
  
**`tags`** &nbsp; const char* const*  
*array of size `tagsCount`*  
  
(Optional) The list of tags that are associated with this content.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The client-defined type of the content.
  
**`url`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Azure CDN URL for retrieval of the catalog item binary content.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
