---
author: jasonsandlin
title: "PFCatalogGetEntityDraftItemsRequest"
description: "PFCatalogGetEntityDraftItemsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetEntityDraftItemsRequest  

PFCatalogGetEntityDraftItemsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetEntityDraftItemsRequest {  
    const char* continuationToken;  
    int32_t count;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* filter;  
} PFCatalogGetEntityDraftItemsRequest;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items created by the caller, if any are available. Should be null on initial request.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. Maximum page size is 10.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) OData Filter to specify ItemType.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
