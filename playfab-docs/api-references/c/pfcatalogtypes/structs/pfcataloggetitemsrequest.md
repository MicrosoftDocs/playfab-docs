---
author: jasonsandlin
title: "PFCatalogGetItemsRequest"
description: "PFCatalogGetItemsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemsRequest  

PFCatalogGetItemsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemsRequest {  
    PFCatalogCatalogAlternateId const* alternateIds;  
    uint32_t alternateIdsCount;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* const* ids;  
    uint32_t idsCount;  
} PFCatalogGetItemsRequest;  
```
  
### Members  
  
**`alternateIds`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*array of size `alternateIdsCount`*  
  
(Optional) List of item alternate IDs.
  
**`alternateIdsCount`** &nbsp; uint32_t  
  
Count of alternateIds
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`ids`** &nbsp; const char* const*  
*array of size `idsCount`*  
  
(Optional) List of Item Ids.
  
**`idsCount`** &nbsp; uint32_t  
  
Count of ids
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
