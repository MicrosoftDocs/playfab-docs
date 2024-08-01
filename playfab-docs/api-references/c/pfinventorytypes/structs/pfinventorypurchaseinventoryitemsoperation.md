---
author: jasonsandlin
title: "PFInventoryPurchaseInventoryItemsOperation"
description: "PFInventoryPurchaseInventoryItemsOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryPurchaseInventoryItemsOperation  

PFInventoryPurchaseInventoryItemsOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryPurchaseInventoryItemsOperation {  
    int32_t const* amount;  
    bool deleteEmptyStacks;  
    double const* durationInSeconds;  
    PFInventoryInventoryItemReference const* item;  
    PFInventoryInitialValues const* newStackValues;  
    PFInventoryPurchasePriceAmount const* priceAmounts;  
    uint32_t priceAmountsCount;  
    const char* storeId;  
} PFInventoryPurchaseInventoryItemsOperation;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to purchase.
  
**`deleteEmptyStacks`** &nbsp; bool  
  
Indicates whether stacks reduced to an amount of 0 during the operation should be deleted from the inventory. (Default = false).
  
**`durationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The duration to purchase.
  
**`item`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the operation applies to.
  
**`newStackValues`** &nbsp; [PFInventoryInitialValues](pfinventoryinitialvalues.md) const*  
*may be nullptr*  
  
(Optional) The values to apply to a stack newly created by this operation.
  
**`priceAmounts`** &nbsp; [PFInventoryPurchasePriceAmount](pfinventorypurchasepriceamount.md) const*  
*may be nullptr*  
  
(Optional) The per-item price the item is expected to be purchased at. This must match a value configured in the Catalog or specified Store.
  
**`priceAmountsCount`** &nbsp; uint32_t  
  
Count of priceAmounts
  
**`storeId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the Store to purchase the item from.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
