---
author: jasonsandlin
title: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse"
description: "PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse  

PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse {  
    const char* titleId;  
    uint32_t titlePlayerAccountsCount;  
} PFProfilesGetTitlePlayersFromMasterPlayerAccountIdsResponse;  
```
  
### Members  
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional id of title to get players from, required if calling using a master_player_account.
  
**`titlePlayerAccountsCount`** &nbsp; uint32_t  
*array of size `titlePlayerAccountsCount`*  
  
(Optional) Dictionary of master player ids mapped to title player entity keys and id pairs.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
