---
author: jasonsandlin
title: "PFInventoryTransferInventoryItemsRequest"
description: "PFInventoryTransferInventoryItemsRequest data model. Transfer the specified inventory items of an entity's container Id to another entity's container Id."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransferInventoryItemsRequest  

PFInventoryTransferInventoryItemsRequest data model. Transfer the specified inventory items of an entity's container Id to another entity's container Id.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransferInventoryItemsRequest {  
    int32_t const* amount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool deleteEmptyStacks;  
    const char* givingCollectionId;  
    PFEntityKey const* givingEntity;  
    const char* givingETag;  
    PFInventoryInventoryItemReference const* givingItem;  
    const char* idempotencyId;  
    PFInventoryInitialValues const* newStackValues;  
    const char* receivingCollectionId;  
    PFEntityKey const* receivingEntity;  
    PFInventoryInventoryItemReference const* receivingItem;  
} PFInventoryTransferInventoryItemsRequest;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to transfer .
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`deleteEmptyStacks`** &nbsp; bool  
  
Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default = false).
  
**`givingCollectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory collection id the request is transferring from. (Default="default").
  
**`givingEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the request is transferring from. Set to the caller by default.
  
**`givingETag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources (before transferring from). More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`givingItem`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the request is transferring from.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The idempotency id for the request.
  
**`newStackValues`** &nbsp; [PFInventoryInitialValues](pfinventoryinitialvalues.md) const*  
*may be nullptr*  
  
(Optional) The values to apply to a stack newly created by this request.
  
**`receivingCollectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory collection id the request is transferring to. (Default="default").
  
**`receivingEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the request is transferring to. Set to the caller by default.
  
**`receivingItem`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the request is transferring to.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
