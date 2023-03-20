---
author: jasonsandlin
title: "PFInventoryRedeemMicrosoftStoreInventoryItemsRequest"
description: "PFInventoryRedeemMicrosoftStoreInventoryItemsRequest data model. Redeem items from the Microsoft Store."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFInventoryRedeemMicrosoftStoreInventoryItemsRequest  

PFInventoryRedeemMicrosoftStoreInventoryItemsRequest data model. Redeem items from the Microsoft Store.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemMicrosoftStoreInventoryItemsRequest {  
    const char* collectionId;  
    const char* collectionsIdKey;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* xboxToken;  
} PFInventoryRedeemMicrosoftStoreInventoryItemsRequest;  
```
  
### Members  
  
**`collectionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The id of the entity's collection to perform this action on. (Default="default").
  
**`collectionsIdKey`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The OneStore Collections Id Key used for AAD authentication.
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`xboxToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Xbox Token used for delegated business partner authentication.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
