---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsResult"
description: "PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsResult data model. For Facebook Instant Game identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsResult  

PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsResult data model. For Facebook Instant Game identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsResult {  
    PFAccountManagementFacebookInstantGamesPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementFacebookInstantGamesPlayFabIdPair](pfaccountmanagementfacebookinstantgamesplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Facebook Instant Games identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
