---
author: jasonsandlin
title: "PFCatalogCreateDraftItemRequest"
description: "PFCatalogCreateDraftItemRequest data model. The item will not be published to the public catalog until the PublishItem API is called for the item."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogCreateDraftItemRequest  

PFCatalogCreateDraftItemRequest data model. The item will not be published to the public catalog until the PublishItem API is called for the item.  

## Syntax  
  
```cpp
typedef struct PFCatalogCreateDraftItemRequest {  
    uint32_t customTagsCount;  
    PFCatalogCatalogItem const* item;  
    bool publish;  
} PFCatalogCreateDraftItemRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Metadata describing the new catalog item to be created.
  
**`publish`** &nbsp; bool  
  
Whether the item should be published immediately.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
