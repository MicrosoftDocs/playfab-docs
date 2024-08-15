---
author: jasonsandlin
title: "PFInventoryTransactionPurchaseDetails"
description: "PFInventoryTransactionPurchaseDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryTransactionPurchaseDetails  

PFInventoryTransactionPurchaseDetails data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionPurchaseDetails {  
    const char* storeId;  
} PFInventoryTransactionPurchaseDetails;  
```
  
### Members  
  
**`storeId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the Store the item was purchased from or null.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
