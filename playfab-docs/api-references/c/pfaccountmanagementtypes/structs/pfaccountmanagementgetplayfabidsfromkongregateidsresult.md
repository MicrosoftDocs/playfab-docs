---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromKongregateIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromKongregateIDsResult data model. For Kongregate identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromKongregateIDsResult  

PFAccountManagementGetPlayFabIDsFromKongregateIDsResult data model. For Kongregate identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromKongregateIDsResult {  
    PFAccountManagementKongregatePlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromKongregateIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementKongregatePlayFabIdPair](pfaccountmanagementkongregateplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Kongregate identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
