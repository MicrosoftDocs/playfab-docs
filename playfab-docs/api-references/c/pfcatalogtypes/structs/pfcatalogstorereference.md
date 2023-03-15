---
author: jasonsandlin
title: "PFCatalogStoreReference"
description: "PFCatalogStoreReference data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogStoreReference  

PFCatalogStoreReference data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogStoreReference {  
    PFCatalogCatalogAlternateId const* alternateId;  
    const char* id;  
} PFCatalogStoreReference;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID of the store.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the store.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
