---
author: jasonsandlin
title: "PFInventoryTransactionOperation"
description: "PFInventoryTransactionOperation data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransactionOperation  

PFInventoryTransactionOperation data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionOperation {  
    int32_t const* amount;  
    double const* durationInSeconds;  
    const char* itemId;  
    const char* itemType;  
    const char* stackId;  
    const char* type;  
} PFInventoryTransactionOperation;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount of items in this transaction.
  
**`durationInSeconds`** &nbsp; double const*  
*may be nullptr*  
  
(Optional) The duration modified in this transaction.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The item id of the items in this transaction.
  
**`itemType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The type of item that the operation occurred on.
  
**`stackId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The stack id of the items in this transaction.
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The type of the operation that occurred.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
