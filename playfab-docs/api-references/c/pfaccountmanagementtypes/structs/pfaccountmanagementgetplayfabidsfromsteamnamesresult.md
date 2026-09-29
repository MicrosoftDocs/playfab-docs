---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromSteamNamesResult"
description: "PFAccountManagementGetPlayFabIDsFromSteamNamesResult data model. For Steam identifiers which have not been linked to PlayFab accounts, or if the user has not logged in recently, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromSteamNamesResult  

PFAccountManagementGetPlayFabIDsFromSteamNamesResult data model. For Steam identifiers which have not been linked to PlayFab accounts, or if the user has not logged in recently, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromSteamNamesResult {  
    PFAccountManagementSteamNamePlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromSteamNamesResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementSteamNamePlayFabIdPair](pfaccountmanagementsteamnameplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Steam identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
