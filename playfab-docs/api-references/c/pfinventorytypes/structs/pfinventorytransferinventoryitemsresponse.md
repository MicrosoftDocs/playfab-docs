---
author: jasonsandlin
title: "PFInventoryTransferInventoryItemsResponse"
description: "PFInventoryTransferInventoryItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFInventoryTransferInventoryItemsResponse  

PFInventoryTransferInventoryItemsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryTransferInventoryItemsResponse {  
    const char* givingETag;  
    const char* const* givingTransactionIds;  
    uint32_t givingTransactionIdsCount;  
    const char* idempotencyId;  
    const char* const* receivingTransactionIds;  
    uint32_t receivingTransactionIdsCount;  
} PFInventoryTransferInventoryItemsResponse;  
```
  
### Members  
  
**`givingETag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources (after transferring from). More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`givingTransactionIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The ids of transactions that occurred as a result of the request's giving action.
  
**`givingTransactionIdsCount`** &nbsp; uint32_t  
  
Count of givingTransactionIds
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The idempotency id for the request.
  
**`receivingTransactionIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The ids of transactions that occurred as a result of the request's receiving action.
  
**`receivingTransactionIdsCount`** &nbsp; uint32_t  
  
Count of receivingTransactionIds
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
