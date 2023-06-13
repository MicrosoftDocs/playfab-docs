---
author: jasonsandlin
title: "PFCatalogGetItemContainersRequest"
description: "PFCatalogGetItemContainersRequest data model. Given an item, return a set of bundles and stores containing the item."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemContainersRequest  

PFCatalogGetItemContainersRequest data model. Given an item, return a set of bundles and stores containing the item.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemContainersRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    const char* continuationToken;  
    int32_t count;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* id;  
} PFCatalogGetItemContainersRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID associated with this item.
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items in the inventory, if any are available. Should be null on initial request.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. Maximum page size is 25.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  