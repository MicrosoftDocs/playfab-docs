---
author: jasonsandlin
title: "PFInventoryTransactionClawbackDetails"
description: "PFInventoryTransactionClawbackDetails data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryTransactionClawbackDetails  

PFInventoryTransactionClawbackDetails data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransactionClawbackDetails {  
    const char* transactionIdClawedback;  
} PFInventoryTransactionClawbackDetails;  
```
  
### Members  
  
**`transactionIdClawedback`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the clawed back operation.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
