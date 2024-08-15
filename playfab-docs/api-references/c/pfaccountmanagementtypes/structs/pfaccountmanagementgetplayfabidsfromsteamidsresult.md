---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromSteamIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromSteamIDsResult data model. For Steam identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromSteamIDsResult  

PFAccountManagementGetPlayFabIDsFromSteamIDsResult data model. For Steam identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromSteamIDsResult {  
    PFAccountManagementSteamPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromSteamIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementSteamPlayFabIdPair](pfaccountmanagementsteamplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Steam identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
