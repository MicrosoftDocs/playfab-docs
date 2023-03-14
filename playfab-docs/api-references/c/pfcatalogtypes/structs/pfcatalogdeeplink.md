---
author: jasonsandlin
title: "PFCatalogDeepLink"
description: "PFCatalogDeepLink data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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

  
  
