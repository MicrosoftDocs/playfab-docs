---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromXboxLiveIDsResult data model. For XboxLive identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
*array of size `dataCount`*  
  
(Optional) Mapping of Xbox Live identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
