---
author: jasonsandlin
title: "PFInventoryGetInventoryCollectionIdsRequest"
description: "PFInventoryGetInventoryCollectionIdsRequest data model. Get a list of Inventory Collection Ids for the specified Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryGetInventoryCollectionIdsRequest  

PFInventoryGetInventoryCollectionIdsRequest data model. Get a list of Inventory Collection Ids for the specified Entity.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetInventoryCollectionIdsRequest {  
    const char* continuationToken;  
    int32_t count;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFInventoryGetInventoryCollectionIdsRequest;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of collection ids, if any are available.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. (Default = 10).
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity the request is about. Set to the caller by default.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
