---
author: jasonsandlin
title: "PFInventoryUpdateInventoryItemsRequest"
description: "PFInventoryUpdateInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will update the entity's inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryUpdateInventoryItemsRequest  

PFInventoryUpdateInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will update the entity's inventory items.  

## Syntax  
  
```cpp
typedef struct PFInventoryUpdateInventoryItemsRequest {  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
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
  
(Optional) The id of the entity's collection to perform this action on. (Default="default"). The number of inventory collections is unlimited.
  
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
  
(Optional) ETags are used for concurrency checking when updating resources. More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request. Idempotency IDs can be used to prevent operation replay in the medium term but will be garbage collected eventually.
  
**`item`** &nbsp; [PFInventoryInventoryItem](pfinventoryinventoryitem.md) const*  
*may be nullptr*  
  
(Optional) The inventory item to update with the specified values.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
