---
author: jasonsandlin
title: "PFInventoryExecuteInventoryOperationsRequest"
description: "PFInventoryExecuteInventoryOperationsRequest data model. Execute a list of Inventory Operations for an Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryExecuteInventoryOperationsRequest  

PFInventoryExecuteInventoryOperationsRequest data model. Execute a list of Inventory Operations for an Entity.  

## Syntax  
  
```cpp
typedef struct PFInventoryExecuteInventoryOperationsRequest {  
    const char* collectionId;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* eTag;  
    const char* idempotencyId;  
    PFInventoryInventoryOperation const* operations;  
    uint32_t operationsCount;  
} PFInventoryExecuteInventoryOperationsRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request.
  
**`operations`** &nbsp; [PFInventoryInventoryOperation](pfinventoryinventoryoperation.md) const*  
*array of size `operationsCount`*  
  
(Optional) The operations to run transactionally. The operations will be executed in-order sequentially and will succeed or fail as a batch.
  
**`operationsCount`** &nbsp; uint32_t  
  
Count of operations
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
