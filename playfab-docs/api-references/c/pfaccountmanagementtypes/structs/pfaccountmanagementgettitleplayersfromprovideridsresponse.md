---
author: jasonsandlin
title: "PFAccountManagementGetTitlePlayersFromProviderIDsResponse"
description: "PFAccountManagementGetTitlePlayersFromProviderIDsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetTitlePlayersFromProviderIDsResponse  

PFAccountManagementGetTitlePlayersFromProviderIDsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetTitlePlayersFromProviderIDsResponse {  
    PFEntityLineageDictionaryEntry const* titlePlayerAccounts;  
    uint32_t titlePlayerAccountsCount;  
} PFAccountManagementGetTitlePlayersFromProviderIDsResponse;  
```
  
### Members  
  
**`titlePlayerAccounts`** &nbsp; [PFEntityLineageDictionaryEntry](../../pftypes/structs/pfentitylineagedictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of provider identifiers mapped to title_player_account lineage. Missing lineage indicates the player either doesn't exist or doesn't play the requested title.
  
**`titlePlayerAccountsCount`** &nbsp; uint32_t  
  
Count of titlePlayerAccounts
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
