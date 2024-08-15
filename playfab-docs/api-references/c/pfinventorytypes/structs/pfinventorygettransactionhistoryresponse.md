---
author: jasonsandlin
title: "PFInventoryGetTransactionHistoryResponse"
description: "PFInventoryGetTransactionHistoryResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetTransactionHistoryResponse  

PFInventoryGetTransactionHistoryResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetTransactionHistoryResponse {  
    const char* continuationToken;  
    PFInventoryTransaction const* transactions;  
    uint32_t transactionsCount;  
} PFInventoryGetTransactionHistoryResponse;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available. Should be null on initial request.
  
**`transactions`** &nbsp; [PFInventoryTransaction](pfinventorytransaction.md) const*  
*may be nullptr*  
  
(Optional) The requested inventory transactions.
  
**`transactionsCount`** &nbsp; uint32_t  
  
Count of transactions
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
