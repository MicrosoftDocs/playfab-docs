---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromGoogleIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromGoogleIDsResult data model. For Google identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromGoogleIDsResult  

PFAccountManagementGetPlayFabIDsFromGoogleIDsResult data model. For Google identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromGoogleIDsResult {  
    PFAccountManagementGooglePlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromGoogleIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementGooglePlayFabIdPair](pfaccountmanagementgoogleplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Google identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
