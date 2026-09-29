---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromSteamNamesRequest"
description: "PFAccountManagementGetPlayFabIDsFromSteamNamesRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromSteamNamesRequest  

PFAccountManagementGetPlayFabIDsFromSteamNamesRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromSteamNamesRequest {  
    const char* const* steamNames;  
    uint32_t steamNamesCount;  
} PFAccountManagementGetPlayFabIDsFromSteamNamesRequest;  
```
  
### Members  
  
**`steamNames`** &nbsp; const char* const*  
  
Array of unique Steam identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 25 in length.
  
**`steamNamesCount`** &nbsp; uint32_t  
  
Count of steamNames
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
