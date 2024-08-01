---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult data model. For PlayStation :tm: Network identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult  

PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult data model. For PlayStation :tm: Network identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult {  
    PFAccountManagementPSNAccountPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromPSNAccountIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementPSNAccountPlayFabIdPair](pfaccountmanagementpsnaccountplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of PlayStation :tm: Network identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
