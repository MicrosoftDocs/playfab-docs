---
author: jasonsandlin
title: "PFInventoryRedeemMicrosoftStoreInventoryItemsRequest"
description: "PFInventoryRedeemMicrosoftStoreInventoryItemsRequest data model. Redeem items from the Microsoft Store."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemMicrosoftStoreInventoryItemsRequest  

PFInventoryRedeemMicrosoftStoreInventoryItemsRequest data model. Redeem items from the Microsoft Store.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemMicrosoftStoreInventoryItemsRequest {  
    const char* collectionId;  
    const char* collectionsIdKey;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    HC_PLATFORM user;  
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
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`user`** &nbsp; HC_PLATFORM  
  
TBD  
  
**`xboxToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Xbox Token used for delegated business partner authentication. Token provided by the Xbox Live SDK method GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
