---
author: jasonsandlin
title: "PFPlayerDataManagementGetUserDataRequest"
description: "PFPlayerDataManagementGetUserDataRequest data model. Data is stored as JSON key-value pairs. Every time the data is updated via any source, the version counter is incremented. If the Version parameter is provided, then this call will only return data if the current version on the system is greater than the value provided. If the Keys parameter is provided, the data object returned will only contain the data specific to the indicated Keys. Otherwise, the full set of custom user data will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementGetUserDataRequest  

PFPlayerDataManagementGetUserDataRequest data model. Data is stored as JSON key-value pairs. Every time the data is updated via any source, the version counter is incremented. If the Version parameter is provided, then this call will only return data if the current version on the system is greater than the value provided. If the Keys parameter is provided, the data object returned will only contain the data specific to the indicated Keys. Otherwise, the full set of custom user data will be returned.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementGetUserDataRequest {  
    uint32_t const* ifChangedFromDataVersion;  
    const char* const* keys;  
    uint32_t keysCount;  
    const char* playFabId;  
} PFPlayerDataManagementGetUserDataRequest;  
```
  
### Members  
  
**`ifChangedFromDataVersion`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) The version that currently exists according to the caller. The call will return the data for all of the keys if the version in the system is greater than this.
  
**`keys`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) List of unique keys to load from.
  
**`keysCount`** &nbsp; uint32_t  
  
Count of keys
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab identifier of the user to load data for. Optional, defaults to yourself if not set. When specified to a PlayFab id of another player, then this will only return public keys for that account.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
