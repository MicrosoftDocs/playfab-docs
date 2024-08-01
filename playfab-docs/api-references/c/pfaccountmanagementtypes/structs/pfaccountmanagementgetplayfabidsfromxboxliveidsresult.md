---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult data model. For XboxLive identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult  

PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult data model. For XboxLive identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult {  
    PFAccountManagementXboxLiveAccountPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementXboxLiveAccountPlayFabIdPair](pfaccountmanagementxboxliveaccountplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Xbox Live identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
