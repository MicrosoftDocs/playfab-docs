---
author: jasonsandlin
title: "PFCatalogUpdateDraftItemRequest"
description: "PFCatalogUpdateDraftItemRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogUpdateDraftItemRequest  

PFCatalogUpdateDraftItemRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogUpdateDraftItemRequest {  
    uint32_t customTagsCount;  
    PFCatalogCatalogItem const* item;  
    bool publish;  
} PFCatalogUpdateDraftItemRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Updated metadata describing the catalog item to be updated.
  
**`publish`** &nbsp; bool  
  
Whether the item should be published immediately.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
