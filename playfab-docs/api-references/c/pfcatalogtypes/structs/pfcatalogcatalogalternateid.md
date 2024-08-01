---
author: jasonsandlin
title: "PFCatalogCatalogAlternateId"
description: "PFCatalogCatalogAlternateId data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCatalogAlternateId  

PFCatalogCatalogAlternateId data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCatalogAlternateId {  
    const char* type;  
    const char* value;  
} PFCatalogCatalogAlternateId;  
```
  
### Members  
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Type of the alternate ID.
  
**`value`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Value of the alternate ID.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
