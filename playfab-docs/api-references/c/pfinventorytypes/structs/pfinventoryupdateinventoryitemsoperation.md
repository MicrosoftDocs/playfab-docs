---
author: jasonsandlin
title: "PFInventoryUpdateInventoryItemsOperation"
description: "PFInventoryUpdateInventoryItemsOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryUpdateInventoryItemsOperation  

PFInventoryUpdateInventoryItemsOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryUpdateInventoryItemsOperation {  
    PFInventoryInventoryItem const* item;  
} PFInventoryUpdateInventoryItemsOperation;  
```
  
### Members  
  
**`item`** &nbsp; [PFInventoryInventoryItem](pfinventoryinventoryitem.md) const*  
*may be nullptr*  
  
(Optional) The inventory item to update with the specified values.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
