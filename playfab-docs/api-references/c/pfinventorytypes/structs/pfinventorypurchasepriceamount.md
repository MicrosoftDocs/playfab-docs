---
author: jasonsandlin
title: "PFInventoryPurchasePriceAmount"
description: "PFInventoryPurchasePriceAmount data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFInventoryPurchasePriceAmount  

PFInventoryPurchasePriceAmount data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryPurchasePriceAmount {  
    int32_t amount;  
    const char* itemId;  
    const char* stackId;
    int32_t balance;  
} PFInventoryPurchasePriceAmount;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t  
  
The amount of the inventory item to use in the purchase .
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory item id to use in the purchase .
  
**`stackId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory stack id the to use in the purchase. Set to "default" by default.

**`balance`** &nbsp; int32_t

(Optional) The balance of the items changed as a result of the transaction.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
