---
author: jasonsandlin
title: "PFInventoryGetInventoryItemsRequest"
description: "PFInventoryGetInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will get the entity's inventory items. ."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryGetInventoryItemsRequest  

PFInventoryGetInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will get the entity's inventory items. .  

## Syntax  
  
```cpp
typedef struct PFInventoryGetInventoryItemsRequest {  
    const char* collectionId;  
    const char* continuationToken;  
    int32_t count;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* filter;  
} PFInventoryGetInventoryItemsRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items in the inventory, if any are available. Should be null on initial request.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. Maximum page size is 50. (Default=10).
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The filters to limit what is returned to the client.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
