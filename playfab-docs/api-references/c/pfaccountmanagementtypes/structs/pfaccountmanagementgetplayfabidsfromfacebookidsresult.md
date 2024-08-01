---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromFacebookIDsResult"
description: "PFAccountManagementGetPlayFabIDsFromFacebookIDsResult data model. For Facebook identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromFacebookIDsResult  

PFAccountManagementGetPlayFabIDsFromFacebookIDsResult data model. For Facebook identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromFacebookIDsResult {  
    PFAccountManagementFacebookPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromFacebookIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementFacebookPlayFabIdPair](pfaccountmanagementfacebookplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of Facebook identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
