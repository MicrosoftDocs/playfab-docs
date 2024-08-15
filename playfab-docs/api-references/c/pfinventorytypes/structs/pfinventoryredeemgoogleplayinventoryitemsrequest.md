---
author: jasonsandlin
title: "PFInventoryRedeemGooglePlayInventoryItemsRequest"
description: "PFInventoryRedeemGooglePlayInventoryItemsRequest data model. Redeem items from the Google Play Store."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemGooglePlayInventoryItemsRequest  

PFInventoryRedeemGooglePlayInventoryItemsRequest data model. Redeem items from the Google Play Store.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemGooglePlayInventoryItemsRequest {  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFInventoryGooglePlayProductPurchase const* purchases;  
    uint32_t purchasesCount;  
} PFInventoryRedeemGooglePlayInventoryItemsRequest;  
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
  
**`purchases`** &nbsp; [PFInventoryGooglePlayProductPurchase](pfinventorygoogleplayproductpurchase.md) const*  
*may be nullptr*  
  
(Optional) The list of purchases to redeem.
  
**`purchasesCount`** &nbsp; uint32_t  
  
Count of purchases
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
