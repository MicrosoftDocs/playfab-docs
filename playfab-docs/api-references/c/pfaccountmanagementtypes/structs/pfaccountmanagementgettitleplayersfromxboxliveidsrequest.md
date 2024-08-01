---
author: jasonsandlin
title: "PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest"
description: "PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest data model. Given a collection of Xbox IDs (XUIDs), returns all title player accounts."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest  

PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest data model. Given a collection of Xbox IDs (XUIDs), returns all title player accounts.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* sandbox;  
    const char* titleId;  
    const char* const* xboxLiveIds;  
    uint32_t xboxLiveIdsCount;  
} PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`sandbox`** &nbsp; const char*  
*is null-terminated*  
  
Xbox Sandbox the players had on their Xbox tokens.
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional ID of title to get players from, required if calling using a master_player_account.
  
**`xboxLiveIds`** &nbsp; const char* const*  
  
List of Xbox Live XUIDs.
  
**`xboxLiveIdsCount`** &nbsp; uint32_t  
  
Count of xboxLiveIds
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
