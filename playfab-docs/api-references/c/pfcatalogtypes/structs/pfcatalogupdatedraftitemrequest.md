---
author: jasonsandlin
title: "PFCatalogUpdateDraftItemRequest"
description: "PFCatalogUpdateDraftItemRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogUpdateDraftItemRequest  

PFCatalogUpdateDraftItemRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogUpdateDraftItemRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFCatalogCatalogItem const* item;  
    bool publish;  
} PFCatalogUpdateDraftItemRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Updated metadata describing the catalog item to be updated.
  
**`publish`** &nbsp; bool  
  
Whether the item should be published immediately. This value is optional, defaults to false.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
