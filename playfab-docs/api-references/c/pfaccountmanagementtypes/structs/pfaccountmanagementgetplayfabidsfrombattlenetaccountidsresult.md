---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsResult"
description: "PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsResult data model. For Battle.net account identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsResult  

PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsResult data model. For Battle.net account identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsResult {  
    PFAccountManagementBattleNetAccountPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementBattleNetAccountPlayFabIdPair](pfaccountmanagementbattlenetaccountplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Battle.net account identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
