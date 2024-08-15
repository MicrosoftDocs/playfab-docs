---
author: jasonsandlin
title: "PFInventoryTransferInventoryItemsResponse"
description: "PFInventoryTransferInventoryItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
    const char* operationStatus;  
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
  
**`operationStatus`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The transfer operation status. Possible values are 'InProgress' or 'Completed'. If the operation has completed, the response code will be 200. Otherwise, it will be 202.
  
**`receivingTransactionIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The ids of transactions that occurred as a result of the request's receiving action.
  
**`receivingTransactionIdsCount`** &nbsp; uint32_t  
  
Count of receivingTransactionIds
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
