---
author: jasonsandlin
title: "PFInventoryGetInventoryOperationStatusRequest"
description: "PFInventoryGetInventoryOperationStatusRequest data model. Get the status of an Inventory Operation using an OperationToken."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFInventoryGetInventoryOperationStatusRequest  

PFInventoryGetInventoryOperationStatusRequest data model. Get the status of an Inventory Operation using an OperationToken.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetInventoryOperationStatusRequest {  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* operationToken;  
} PFInventoryGetInventoryOperationStatusRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`operationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The token to get the status of the inventory operation.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
