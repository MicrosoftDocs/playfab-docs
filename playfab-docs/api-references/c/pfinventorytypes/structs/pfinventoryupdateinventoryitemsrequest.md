---
author: jasonsandlin
title: "PFInventoryUpdateInventoryItemsRequest"
description: "PFInventoryUpdateInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will update the entity's inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryUpdateInventoryItemsRequest  

PFInventoryUpdateInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will update the entity's inventory items.  

## Syntax  
  
```cpp
typedef struct PFInventoryUpdateInventoryItemsRequest {  
    const char* collectionId;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* eTag;  
    const char* idempotencyId;  
    PFInventoryInventoryItem const* item;  
} PFInventoryUpdateInventoryItemsRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request.
  
**`item`** &nbsp; [PFInventoryInventoryItem](pfinventoryinventoryitem.md) const*  
*may be nullptr*  
  
(Optional) The inventory item to update with the specified values.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
