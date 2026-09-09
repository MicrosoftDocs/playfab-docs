---
author: jasonsandlin
title: "PFInventoryTransactionPurchaseDetails"
description: "PFInventoryTransactionPurchaseDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryTransactionPurchaseDetails  

PFInventoryTransactionPurchaseDetails data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionPurchaseDetails {  
    const char* itemFriendlyId;  
    const char* itemId;  
    const char* storeFriendlyId;  
    const char* storeId;  
} PFInventoryTransactionPurchaseDetails;  
```
  
### Members  
  
**`itemFriendlyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The friendly id of the item that was purchased.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the item that was purchased.
  
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

  
  
