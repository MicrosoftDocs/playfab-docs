---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest  

PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest {  
    const char* const* gameCenterIDs;  
    uint32_t gameCenterIDsCount;  
} PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest;  
```
  
### Members  
  
**`gameCenterIDs`** &nbsp; const char* const*  
  
Array of unique Game Center identifiers (the Player Identifier) for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`gameCenterIDsCount`** &nbsp; uint32_t  
  
Count of gameCenterIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
