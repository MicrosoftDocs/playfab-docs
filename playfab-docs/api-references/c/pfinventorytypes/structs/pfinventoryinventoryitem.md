---
author: jasonsandlin
title: "PFInventoryInventoryItem"
description: "PFInventoryInventoryItem data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryInventoryItem  

PFInventoryInventoryItem data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryInventoryItem {  
    int32_t const* amount;  
    PFJsonObject displayProperties;  
    time_t const* expirationDate;  
    const char* id;  
    const char* stackId;  
    const char* type;  
} PFInventoryInventoryItem;  
```
  
### Members  
  
**`amount`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The amount of the item.
  
**`displayProperties`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) Game specific properties for display purposes. This is an arbitrary JSON blob.
  
**`expirationDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Only used for subscriptions. The date of when the item will expire in UTC. If not provided then the product will be available indefinitely.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the item. This should correspond to the item id in the catalog.
  
**`stackId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The stack id of the item.
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The type of the item. This should correspond to the item type in the catalog.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
