---
author: jasonsandlin
title: "PFInventorySubtractInventoryItemsOperation"
description: "PFInventorySubtractInventoryItemsOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventorySubtractInventoryItemsOperation  

PFInventorySubtractInventoryItemsOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventorySubtractInventoryItemsOperation {  
    int32_t const* amount;  
    bool deleteEmptyStacks;  
    double const* durationInSeconds;  
    PFInventoryInventoryItemReference const* item;  
} PFInventorySubtractInventoryItemsOperation;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to subtract from the current item amount.
  
**`deleteEmptyStacks`** &nbsp; bool  
  
Indicates whether stacks reduced to an amount of 0 during the request should be deleted from the inventory. (Default = false).
  
**`durationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The duration to subtract from the current item expiration date.
  
**`item`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the operation applies to.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
