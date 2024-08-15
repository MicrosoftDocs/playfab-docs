---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest"
description: "PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest  

PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest {  
    const char* const* nintendoSwitchDeviceIds;  
    uint32_t nintendoSwitchDeviceIdsCount;  
} PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest;  
```
  
### Members  
  
**`nintendoSwitchDeviceIds`** &nbsp; const char* const*  
  
Array of unique Nintendo Switch Device identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`nintendoSwitchDeviceIdsCount`** &nbsp; uint32_t  
  
Count of nintendoSwitchDeviceIds
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
