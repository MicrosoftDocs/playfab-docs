---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsResult data model. For Google Play Games identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsResult  

PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsResult data model. For Google Play Games identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsResult {  
    PFAccountManagementGooglePlayGamesPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementGooglePlayGamesPlayFabIdPair](pfaccountmanagementgoogleplaygamesplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Google Play Games identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
