---
author: jasonsandlin
title: "PFInventoryDeleteInventoryCollectionRequest"
description: "PFInventoryDeleteInventoryCollectionRequest data model. Delete an Inventory Collection by the specified Id for an Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryDeleteInventoryCollectionRequest  

PFInventoryDeleteInventoryCollectionRequest data model. Delete an Inventory Collection by the specified Id for an Entity.  

## Syntax  
  
```cpp
typedef struct PFInventoryDeleteInventoryCollectionRequest {  
    const char* collectionId;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* eTag;  
} PFInventoryDeleteInventoryCollectionRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory collection id the request applies to.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the request is about. Set to the caller by default.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
