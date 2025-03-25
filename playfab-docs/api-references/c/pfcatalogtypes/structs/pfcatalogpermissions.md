---
author: jasonsandlin
title: "PFCatalogPermissions"
description: "PFCatalogPermissions data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFCatalogPermissions  

PFCatalogPermissions data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogPermissions {  
    const char* const* segmentIds;  
    uint32_t segmentIdsCount;  
} PFCatalogPermissions;  
```
  
### Members  
  
**`segmentIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of ids of Segments that the a player can be in to purchase from the store. When a value is provided, the player must be in at least one of the segments listed for the purchase to be allowed.
  
**`segmentIdsCount`** &nbsp; uint32_t  
  
Count of segmentIds
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
