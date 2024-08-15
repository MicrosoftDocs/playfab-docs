---
author: jasonsandlin
title: "PFInventoryTransactionTransferDetails"
description: "PFInventoryTransactionTransferDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransactionTransferDetails  

PFInventoryTransactionTransferDetails data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionTransferDetails {  
    const char* givingCollectionId;  
    PFEntityKey const* givingEntity;  
    const char* receivingCollectionId;  
    PFEntityKey const* receivingEntity;  
    const char* transferId;  
} PFInventoryTransactionTransferDetails;  
```
  
### Members  
  
**`givingCollectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The collection id the items were transferred from or null if it was the current collection.
  
**`givingEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the items were transferred from or null if it was the current entity.
  
**`receivingCollectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The collection id the items were transferred to or null if it was the current collection.
  
**`receivingEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the items were transferred to or null if it was the current entity.
  
**`transferId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the transfer that occurred.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
