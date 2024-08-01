---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult data model. For Game Center identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult  

PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult data model. For Game Center identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult {  
    PFAccountManagementGameCenterPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementGameCenterPlayFabIdPair](pfaccountmanagementgamecenterplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Game Center identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
