---
author: jasonsandlin
title: "PFInventoryGetInventoryItemsRequest"
description: "PFInventoryGetInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will get the entity's inventory items. ."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetInventoryItemsRequest  

PFInventoryGetInventoryItemsRequest data model. Given an entity type, entity identifier and container details, will get the entity's inventory items. .  

## Syntax  
  
```cpp
typedef struct PFInventoryGetInventoryItemsRequest {  
    const char* collectionId;  
    const char* continuationToken;  
    int32_t count;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* filter;  
} PFInventoryGetInventoryItemsRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items in the inventory, if any are available. Should be null on initial request.
  
**`count`** &nbsp; int32_t  
  
Number of items to retrieve. This value is optional. Maximum page size is 50. The default value is 10.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`filter`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) OData Filter to refine the items returned. InventoryItem properties 'type', 'id', and 'stackId' can be used in the filter. For example: "type eq 'currency'".
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
