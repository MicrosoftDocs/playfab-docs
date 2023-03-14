---
author: jasonsandlin
title: "PFInventoryExecuteInventoryOperationsResponse"
description: "PFInventoryExecuteInventoryOperationsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryExecuteInventoryOperationsResponse  

PFInventoryExecuteInventoryOperationsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryExecuteInventoryOperationsResponse {  
    const char* eTag;  
    const char* idempotencyId;  
    const char* const* transactionIds;  
    uint32_t transactionIdsCount;  
} PFInventoryExecuteInventoryOperationsResponse;  
```
  
### Members  
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The idempotency id used in the request.
  
**`transactionIds`** &nbsp; const char* const*  
*array of size `transactionIdsCount`*  
  
(Optional) The ids of the transactions that occurred as a result of the request.
  
**`transactionIdsCount`** &nbsp; uint32_t  
  
Count of transactionIds
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
