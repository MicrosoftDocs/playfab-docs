---
author: jasonsandlin
title: "PFCatalogDeepLinkFormat"
description: "PFCatalogDeepLinkFormat data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogDeepLinkFormat  

PFCatalogDeepLinkFormat data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogDeepLinkFormat {  
    const char* format;  
    const char* platform;  
} PFCatalogDeepLinkFormat;  
```
  
### Members  
  
**`format`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The format of the deep link to return. The format should contain '{id}' to represent where the item ID should be placed.
  
**`platform`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The target platform for the deep link.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
