---
author: jasonsandlin
title: "PFCatalogPublishDraftItemRequest"
description: "PFCatalogPublishDraftItemRequest data model. The call kicks off a workflow to publish the item to the public catalog. The Publish Status API should be used to monitor the publish job."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogPublishDraftItemRequest  

PFCatalogPublishDraftItemRequest data model. The call kicks off a workflow to publish the item to the public catalog. The Publish Status API should be used to monitor the publish job.  

## Syntax  
  
```cpp
typedef struct PFCatalogPublishDraftItemRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* eTag;  
    const char* id;  
} PFCatalogPublishDraftItemRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID associated with this item.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETag of the catalog item to published from the working catalog to the public catalog. Used for optimistic concurrency. If the provided ETag does not match the ETag in the current working catalog, the request will be rejected. If not provided, the current version of the document in the working catalog will be published.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
