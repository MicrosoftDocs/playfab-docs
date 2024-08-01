---
author: jasonsandlin
title: "PFInventoryExecuteInventoryOperationsRequest"
description: "PFInventoryExecuteInventoryOperationsRequest data model. Execute a list of Inventory Operations for an Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryExecuteInventoryOperationsRequest  

PFInventoryExecuteInventoryOperationsRequest data model. Execute a list of Inventory Operations for an Entity.  

## Syntax  
  
```cpp
typedef struct PFInventoryExecuteInventoryOperationsRequest {  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
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
  
(Optional) The id of the entity's collection to perform this action on. (Default="default"). The number of inventory collections is unlimited.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources. More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Idempotency ID for this request. Idempotency IDs can be used to prevent operation replay in the medium term but will be garbage collected eventually.
  
**`operations`** &nbsp; [PFInventoryInventoryOperation](pfinventoryinventoryoperation.md) const*  
*may be nullptr*  
  
(Optional) The operations to run transactionally. The operations will be executed in-order sequentially and will succeed or fail as a batch. Up to 10 operations can be added.
  
**`operationsCount`** &nbsp; uint32_t  
  
Count of operations
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
