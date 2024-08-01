---
author: jasonsandlin
title: "PFInventoryRedeemPlayStationStoreInventoryItemsRequest"
description: "PFInventoryRedeemPlayStationStoreInventoryItemsRequest data model. Redeem items from the PlayStation Store."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInventoryRedeemPlayStationStoreInventoryItemsRequest  

PFInventoryRedeemPlayStationStoreInventoryItemsRequest data model. Redeem items from the PlayStation Store.  

## Syntax  
  
```cpp
typedef struct PFInventoryRedeemPlayStationStoreInventoryItemsRequest {  
    const char* authorizationCode;  
    const char* collectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* redirectUri;  
    const char* serviceLabel;  
} PFInventoryRedeemPlayStationStoreInventoryItemsRequest;  
```
  
### Members  
  
**`authorizationCode`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Auth code returned by PlayStation :tm: Network OAuth system.
  
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
  
**`redirectUri`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Redirect URI supplied to PlayStation :tm: Network when requesting an auth code.
  
**`serviceLabel`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional Service Label to pass into the request.
  
  
## Requirements  
  
**Header:** PFInventoryTypes.h
  
## See also  
[PFInventoryTypes members](../pfinventorytypes_members.md)  

  
  
