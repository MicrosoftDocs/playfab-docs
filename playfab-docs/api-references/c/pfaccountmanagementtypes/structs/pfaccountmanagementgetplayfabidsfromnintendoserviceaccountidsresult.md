---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult"
description: "PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult data model. For Nintendo Service Account identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult  

PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult data model. For Nintendo Service Account identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult {  
    PFAccountManagementNintendoServiceAccountPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementNintendoServiceAccountPlayFabIdPair](pfaccountmanagementnintendoserviceaccountplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Nintendo Switch Service Account identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
