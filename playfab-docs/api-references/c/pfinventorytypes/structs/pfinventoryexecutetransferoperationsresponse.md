---
author: jasonsandlin
title: "PFInventoryExecuteTransferOperationsResponse"
description: "PFInventoryExecuteTransferOperationsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFInventoryExecuteTransferOperationsResponse  

PFInventoryExecuteTransferOperationsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryExecuteTransferOperationsResponse {  
    const char* givingETag;  
    const char* const* givingTransactionIds;  
    uint32_t givingTransactionIdsCount;  
    const char* idempotencyId;  
    const char* operationStatus;  
    const char* operationToken;  
    const char* receivingETag;  
    const char* const* receivingTransactionIds;  
    uint32_t receivingTransactionIdsCount;  
} PFInventoryExecuteTransferOperationsResponse;  
```
  
### Members  
  
**`givingETag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources (before transferring from). This value will be empty if the operation has not completed yet. More information about using ETags can be found here: [https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.](/gaming/playfab/features/economy-v2/catalog/etags.)
  
**`givingTransactionIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The ids of transactions that occurred as a result of the request's giving action.
  
**`givingTransactionIdsCount`** &nbsp; uint32_t  
  
Count of givingTransactionIds
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request.
  
**`operationStatus`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The transfer operation status. Possible values are 'InProgress' or 'Completed'. If the operation has completed, the response code will be 200. Otherwise, it will be 202.
  
**`operationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The token that can be used to get the status of the transfer operation. This will only have a value if OperationStatus is 'InProgress'.
  
**`receivingETag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources (before transferring to). This value will be empty if the operation has not completed yet.
  
**`receivingTransactionIds`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The ids of transactions that occurred as a result of the request's receiving action.
  
**`receivingTransactionIdsCount`** &nbsp; uint32_t  
  
Count of receivingTransactionIds
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
