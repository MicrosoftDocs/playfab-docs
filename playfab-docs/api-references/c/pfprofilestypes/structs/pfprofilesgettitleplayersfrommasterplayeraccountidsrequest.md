---
author: jasonsandlin
title: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest"
description: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest data model. Given a master player account id (PlayFab ID), returns all title player accounts associated with it."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest  

PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest data model. Given a master player account id (PlayFab ID), returns all title player accounts associated with it.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* const* masterPlayerAccountIds;  
    uint32_t masterPlayerAccountIdsCount;  
    const char* titleId;  
} PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`masterPlayerAccountIds`** &nbsp; const char* const*  
  
Master player account ids.
  
**`masterPlayerAccountIdsCount`** &nbsp; uint32_t  
  
Count of masterPlayerAccountIds
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Id of title to get players from.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
