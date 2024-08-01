---
author: jasonsandlin
title: "PFCatalogCreateDraftItemRequest"
description: "PFCatalogCreateDraftItemRequest data model. The item will not be published to the public catalog until the PublishItem API is called for the item."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCreateDraftItemRequest  

PFCatalogCreateDraftItemRequest data model. The item will not be published to the public catalog until the PublishItem API is called for the item.  

## Syntax  
  
```cpp
typedef struct PFCatalogCreateDraftItemRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFCatalogCatalogItem const* item;  
    bool publish;  
} PFCatalogCreateDraftItemRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`item`** &nbsp; [PFCatalogCatalogItem](pfcatalogcatalogitem.md) const*  
*may be nullptr*  
  
(Optional) Metadata describing the new catalog item to be created.
  
**`publish`** &nbsp; bool  
  
Whether the item should be published immediately. This value is optional, defaults to false.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
