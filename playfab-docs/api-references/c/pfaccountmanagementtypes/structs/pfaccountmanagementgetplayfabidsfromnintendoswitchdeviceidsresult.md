---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsResult"
description: "PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsResult data model. For Nintendo Switch identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsResult  

PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsResult data model. For Nintendo Switch identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsResult {  
    PFAccountManagementNintendoSwitchPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementNintendoSwitchPlayFabIdPair](pfaccountmanagementnintendoswitchplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Nintendo Switch Device identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
