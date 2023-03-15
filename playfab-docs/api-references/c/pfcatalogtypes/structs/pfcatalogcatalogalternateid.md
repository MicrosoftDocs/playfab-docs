---
author: jasonsandlin
title: "PFCatalogCatalogAlternateId"
description: "PFCatalogCatalogAlternateId data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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

  
  
