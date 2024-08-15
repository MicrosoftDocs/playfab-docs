---
author: jasonsandlin
title: "PFInventoryTransferInventoryItemsOperation"
description: "PFInventoryTransferInventoryItemsOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransferInventoryItemsOperation  

PFInventoryTransferInventoryItemsOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransferInventoryItemsOperation {  
    int32_t const* amount;  
    bool deleteEmptyStacks;  
    PFInventoryInventoryItemReference const* givingItem;  
    PFInventoryInitialValues const* newStackValues;  
    PFInventoryInventoryItemReference const* receivingItem;  
} PFInventoryTransferInventoryItemsOperation;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to transfer.
  
**`deleteEmptyStacks`** &nbsp; bool  
  
Indicates whether stacks reduced to an amount of 0 during the operation should be deleted from the inventory. (Default = false).
  
**`givingItem`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the operation is transferring from.
  
**`newStackValues`** &nbsp; [PFInventoryInitialValues](pfinventoryinitialvalues.md) const*  
*may be nullptr*  
  
(Optional) The values to apply to a stack newly created by this operation.
  
**`receivingItem`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the operation is transferring to.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
