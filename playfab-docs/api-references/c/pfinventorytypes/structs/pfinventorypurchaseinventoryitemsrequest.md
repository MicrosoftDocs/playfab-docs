---
author: jasonsandlin
title: "PFInventoryPurchaseInventoryItemsRequest"
description: "PFInventoryPurchaseInventoryItemsRequest data model. Purchase a single item or bundle, paying the associated price."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryPurchaseInventoryItemsRequest  

PFInventoryPurchaseInventoryItemsRequest data model. Purchase a single item or bundle, paying the associated price.  

## Syntax  
  
```cpp
typedef struct PFInventoryPurchaseInventoryItemsRequest {  
    int32_t const* amount;  
    const char* collectionId;  
    uint32_t customTagsCount;  
    bool deleteEmptyStacks;  
    double const* durationInSeconds;  
    PFEntityKey const* entity;  
    const char* eTag;  
    const char* idempotencyId;  
    PFInventoryInventoryItemReference const* item;  
    PFInventoryInitialValues const* newStackValues;  
    PFInventoryPurchasePriceAmount const* priceAmounts;  
    uint32_t priceAmountsCount;  
    const char* storeId;  
} PFInventoryPurchaseInventoryItemsRequest;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to purchase.
  
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
  
(Optional) The duration to purchase.
  
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
  
**`newStackValues`** &nbsp; [PFInventoryInitialValues](pfinventoryinitialvalues.md) const*  
*may be nullptr*  
  
(Optional) The values to apply to a stack newly created by this request.
  
**`priceAmounts`** &nbsp; [PFInventoryPurchasePriceAmount](pfinventorypurchasepriceamount.md) const*  
*array of size `priceAmountsCount`*  
  
(Optional) The per-item price the item is expected to be purchased at. This must match a value configured in the Catalog or specified Store. .
  
**`priceAmountsCount`** &nbsp; uint32_t  
  
Count of priceAmounts
  
**`storeId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the Store to purchase the item from.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
