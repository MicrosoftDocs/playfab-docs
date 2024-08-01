---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromSteamIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromSteamIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromSteamIDsRequest  

PFAccountManagementGetPlayFabIDsFromSteamIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromSteamIDsRequest {  
    const char* const* steamStringIDs;  
    uint32_t steamStringIDsCount;  
} PFAccountManagementGetPlayFabIDsFromSteamIDsRequest;  
```
  
### Members  
  
**`steamStringIDs`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Array of unique Steam identifiers (Steam profile IDs) for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`steamStringIDsCount`** &nbsp; uint32_t  
  
Count of steamStringIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
