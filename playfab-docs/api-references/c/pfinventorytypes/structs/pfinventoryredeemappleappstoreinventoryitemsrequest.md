---
author: jasonsandlin
title: "PFInventoryRedeemAppleAppStoreInventoryItemsRequest"
description: "PFInventoryRedeemAppleAppStoreInventoryItemsRequest data model. Redeem items from the Apple App Store."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemAppleAppStoreInventoryItemsRequest  

PFInventoryRedeemAppleAppStoreInventoryItemsRequest data model. Redeem items from the Apple App Store.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemAppleAppStoreInventoryItemsRequest {  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* receipt;  
} PFInventoryRedeemAppleAppStoreInventoryItemsRequest;  
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
  
**`receipt`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The receipt provided by the Apple marketplace upon successful purchase.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
