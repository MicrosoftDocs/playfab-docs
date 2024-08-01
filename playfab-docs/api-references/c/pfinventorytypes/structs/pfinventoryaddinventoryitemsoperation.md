---
author: jasonsandlin
title: "PFInventoryAddInventoryItemsOperation"
description: "PFInventoryAddInventoryItemsOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryAddInventoryItemsOperation  

PFInventoryAddInventoryItemsOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryAddInventoryItemsOperation {  
    int32_t const* amount;  
    double const* durationInSeconds;  
    PFInventoryInventoryItemReference const* item;  
    PFInventoryInitialValues const* newStackValues;  
} PFInventoryAddInventoryItemsOperation;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount to add to the current item amount.
  
**`durationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The duration to add to the current item expiration date.
  
**`item`** &nbsp; [PFInventoryInventoryItemReference](pfinventoryinventoryitemreference.md) const*  
*may be nullptr*  
  
(Optional) The inventory item the operation applies to.
  
**`newStackValues`** &nbsp; [PFInventoryInitialValues](pfinventoryinitialvalues.md) const*  
*may be nullptr*  
  
(Optional) The values to apply to a stack newly created by this operation.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
