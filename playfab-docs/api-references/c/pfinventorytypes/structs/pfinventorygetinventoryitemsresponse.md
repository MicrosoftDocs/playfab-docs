---
author: jasonsandlin
title: "PFInventoryGetInventoryItemsResponse"
description: "PFInventoryGetInventoryItemsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryGetInventoryItemsResponse  

PFInventoryGetInventoryItemsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFInventoryGetInventoryItemsResponse {  
    const char* continuationToken;  
    const char* eTag;  
    PFInventoryInventoryItem const* items;  
    uint32_t itemsCount;  
} PFInventoryGetInventoryItemsResponse;  
```
  
### Members  
  
**`continuationToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) An opaque token used to retrieve the next page of items, if any are available.
  
**`eTag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ETags are used for concurrency checking when updating resources. More information about using ETags can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/etags.
  
**`items`** &nbsp; [PFInventoryInventoryItem](pfinventoryinventoryitem.md) const*  
*may be nullptr*  
  
(Optional) The requested inventory items.
  
**`itemsCount`** &nbsp; uint32_t  
  
Count of items
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
