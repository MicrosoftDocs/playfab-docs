---
author: jasonsandlin
title: "PFInventoryTransactionPurchaseDetails"
description: "PFInventoryTransactionPurchaseDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFInventoryTransactionPurchaseDetails  

PFInventoryTransactionPurchaseDetails data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionPurchaseDetails {  
    const char* storeFriendlyId;  
    const char* storeId;  
} PFInventoryTransactionPurchaseDetails;  
```
  
### Members  
  
**`storeFriendlyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The friendly id of the Store the item was purchased from or null.
  
**`storeId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the Store the item was purchased from or null.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
