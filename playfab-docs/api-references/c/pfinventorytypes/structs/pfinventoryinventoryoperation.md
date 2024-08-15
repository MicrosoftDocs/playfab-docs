---
author: jasonsandlin
title: "PFInventoryInventoryOperation"
description: "PFInventoryInventoryOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryInventoryOperation  

PFInventoryInventoryOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryInventoryOperation {  
    PFInventoryAddInventoryItemsOperation const* add;  
    PFInventoryDeleteInventoryItemsOperation const* deleteOp;  
    PFInventoryPurchaseInventoryItemsOperation const* purchase;  
    PFInventorySubtractInventoryItemsOperation const* subtract;  
    PFInventoryTransferInventoryItemsOperation const* transfer;  
    PFInventoryUpdateInventoryItemsOperation const* update;  
} PFInventoryInventoryOperation;  
```
  
### Members  
  
**`add`** &nbsp; [PFInventoryAddInventoryItemsOperation](pfinventoryaddinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The add operation.
  
**`deleteOp`** &nbsp; [PFInventoryDeleteInventoryItemsOperation](pfinventorydeleteinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The delete operation.
  
**`purchase`** &nbsp; [PFInventoryPurchaseInventoryItemsOperation](pfinventorypurchaseinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The purchase operation.
  
**`subtract`** &nbsp; [PFInventorySubtractInventoryItemsOperation](pfinventorysubtractinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The subtract operation.
  
**`transfer`** &nbsp; [PFInventoryTransferInventoryItemsOperation](pfinventorytransferinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The transfer operation.
  
**`update`** &nbsp; [PFInventoryUpdateInventoryItemsOperation](pfinventoryupdateinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The update operation.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
