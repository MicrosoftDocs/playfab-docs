---
author: jasonsandlin
title: "PFInventoryRedeemNintendoEShopInventoryItemsRequest"
description: "PFInventoryRedeemNintendoEShopInventoryItemsRequest data model. Redeem items from the Nintendo EShop."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemNintendoEShopInventoryItemsRequest  

PFInventoryRedeemNintendoEShopInventoryItemsRequest data model. Redeem items from the Nintendo EShop.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemNintendoEShopInventoryItemsRequest {  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* nintendoServiceAccountIdToken;  
} PFInventoryRedeemNintendoEShopInventoryItemsRequest;  
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
  
**`nintendoServiceAccountIdToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The Nintendo provided token authorizing redemption.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
