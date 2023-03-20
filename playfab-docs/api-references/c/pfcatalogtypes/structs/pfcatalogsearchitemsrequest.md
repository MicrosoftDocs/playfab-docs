---
author: jasonsandlin
title: "PFCatalogSearchItemsRequest"
description: "PFCatalogSearchItemsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogSearchItemsRequest  

PFCatalogSearchItemsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogSearchItemsRequest {  
    const char* continuationToken;  
    int32_t count;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* filter;  
    const char* orderBy;  
    const char* search;  
    const char* select;  
    PFCatalogStoreReference const* store;  
} PFCatalogSearchItemsRequest;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. Maximum page size is 50. Default value is 10.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData filter used to refine the search query.
  
**`orderBy`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData orderBy used to order the results of the search query.
  
**`search`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The text to search for.
  
**`select`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData select query option used to augment the search results. If not defined, the default search result metadata will be returned.
  
**`store`** &nbsp; [PFCatalogStoreReference](pfcatalogstorereference.md) const*  
*may be nullptr*  
  
(Optional) The store to restrict the search request to.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
