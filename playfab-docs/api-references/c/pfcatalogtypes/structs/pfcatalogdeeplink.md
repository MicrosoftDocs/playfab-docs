---
author: jasonsandlin
title: "PFCatalogDeepLink"
description: "PFCatalogDeepLink data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogDeepLink  

PFCatalogDeepLink data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogDeepLink {  
    const char* platform;  
    const char* url;  
} PFCatalogDeepLink;  
```
  
### Members  
  
**`platform`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Target platform for this deep link.
  
**`url`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The deep link for this platform.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
