---
author: jasonsandlin
title: "PFInventoryExecuteTransferOperationsRequest"
description: "PFInventoryExecuteTransferOperationsRequest data model. Transfer the specified list of inventory items of an entity's container Id to another entity's container Id."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryExecuteTransferOperationsRequest  

PFInventoryExecuteTransferOperationsRequest data model. Transfer the specified list of inventory items of an entity's container Id to another entity's container Id.  

## Syntax  
  
```cpp
typedef struct PFInventoryExecuteTransferOperationsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* givingCollectionId;  
    PFEntityKey const* givingEntity;  
    const char* givingETag;  
    const char* idempotencyId;  
    PFInventoryTransferInventoryItemsOperation const* operations;  
    uint32_t operationsCount;  
    const char* receivingCollectionId;  
    PFEntityKey const* receivingEntity;  
} PFInventoryExecuteTransferOperationsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`givingCollectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory collection id the request is transferring from. (Default="default").
  
**`givingEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the request is transferring from. Set to the caller by default.
  
**`givingETag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources. More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`idempotencyId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The idempotency id for the request.
  
**`operations`** &nbsp; [PFInventoryTransferInventoryItemsOperation](pfinventorytransferinventoryitemsoperation.md) const*  
*may be nullptr*  
  
(Optional) The transfer operations to run transactionally. The operations will be executed in-order sequentially and will succeed or fail as a batch. Up to 50 operations can be added.
  
**`operationsCount`** &nbsp; uint32_t  
  
Count of operations
  
**`receivingCollectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The inventory collection id the request is transferring to. (Default="default").
  
**`receivingEntity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the request is transferring to. Set to the caller by default.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
