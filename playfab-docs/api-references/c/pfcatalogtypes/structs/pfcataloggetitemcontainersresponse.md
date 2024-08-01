---
author: jasonsandlin
title: "PFCatalogGetItemContainersResponse"
description: "PFCatalogGetItemContainersResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemContainersResponse  

PFCatalogGetItemContainersResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemContainersResponse {  
    PFCatalogCatalogItem const* containers;  
    uint32_t containersCount;  
    const char* continuationToken;  
} PFCatalogGetItemContainersResponse;  
```
  
### Members  
  
**`containers`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) List of Bundles and Stores containing the requested items.
  
**`containersCount`** &nbsp; uint32_t  
  
Count of containers
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
