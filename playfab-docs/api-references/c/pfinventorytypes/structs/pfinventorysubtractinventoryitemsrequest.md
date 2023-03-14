---
author: jasonsandlin
title: "PFInventorySubtractInventoryItemsRequest"
description: "PFInventorySubtractInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will subtract the specified inventory items. ."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventorySubtractInventoryItemsRequest  

PFInventorySubtractInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will subtract the specified inventory items. .  

## Syntax  
  
```cpp
typedef struct PFInventorySubtractInventoryItemsRequest {  
    int32_t const* amount;  
    const char* collectionId;  
    uint32_t customTagsCount;  
    bool deleteEmptyStacks;  
    double const* durationInSeconds;  
    PFEntityKey const* entity;  
    const char* eTag;  
    const char* idempotencyId;  
    PFInventoryInventoryItemReference const* item;  
} PFInventorySubtractInventoryItemsRequest;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to subtract for the current item.
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`deleteEmptyStacks`** &nbsp; bool  
  
Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default=false).
  
**`durationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The duration to subtract from the current item expiration date.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request.
  
**`item`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the request applies to.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
