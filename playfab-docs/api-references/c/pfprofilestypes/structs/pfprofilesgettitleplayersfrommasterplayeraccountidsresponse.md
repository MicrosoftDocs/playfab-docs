---
author: jasonsandlin
title: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse"
description: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse  

PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse {  
    const char* titleId;  
    PFEntityKeyDictionaryEntry const* titlePlayerAccounts;  
    uint32_t titlePlayerAccountsCount;  
} PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse;  
```
  
### Members  
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional id of title to get players from, required if calling using a master_player_account.
  
**`titlePlayerAccounts`** &nbsp; [PFEntityKeyDictionaryEntry](../../pftypes/structs/pfentitykeydictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of master player ids mapped to title player entity keys and id pairs.
  
**`titlePlayerAccountsCount`** &nbsp; uint32_t  
  
Count of titlePlayerAccounts
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
