---
author: jasonsandlin
title: "PFCatalogSearchItemsRequest"
description: "PFCatalogSearchItemsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogSearchItemsRequest  

PFCatalogSearchItemsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogSearchItemsRequest {  
    const char* continuationToken;  
    int32_t count;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* filter;  
    const char* language;  
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
  
Number of items to retrieve. This value is optional. Maximum page size is 50. Default value is 10.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData filter used to refine the search query (For example: "type eq 'ugc'"). More info about Filter Complexity limits can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/search#limits.
  
**`language`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The locale to be returned in the result.
  
**`orderBy`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An OData orderBy used to order the results of the search query. For example: "rating/average asc" .
  
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

  
  
