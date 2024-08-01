---
author: jasonsandlin
title: "PFInventoryAddInventoryItemsRequest"
description: "PFInventoryAddInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will add the specified inventory items."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryAddInventoryItemsRequest  

PFInventoryAddInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will add the specified inventory items.  

## Syntax  
  
```cpp
typedef struct PFInventoryAddInventoryItemsRequest {  
    int32_t const* amount;  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    double const* durationInSeconds;  
    PFEntityKey const* entity;  
    const char* eTag;  
    const char* idempotencyId;  
    PFInventoryInventoryItemReference const* item;  
    PFInventoryInitialValues const* newStackValues;  
} PFInventoryAddInventoryItemsRequest;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to add for the current item.
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default"). The number of inventory collections is unlimited.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`durationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The duration to add to the current item expiration date.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources. More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request. Idempotency IDs can be used to prevent operation replay in the medium term but will be garbage collected eventually.
  
**`item`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the request applies to.
  
**`newStackValues`** &nbsp; [PFInventoryInitialValues](pfinventoryinitialvalues.md) const*  
*may be nullptr*  
  
(Optional) The values to apply to a stack newly created by this request.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
