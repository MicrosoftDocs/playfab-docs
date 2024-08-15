---
author: jasonsandlin
title: "PFAccountManagementRevokeBansRequest"
description: "PFAccountManagementRevokeBansRequest data model. Setting the active state of all bans requested to Inactive regardless of whether that ban has already expired. BanIds that do not exist will be skipped. Returns information about applied updates only. ."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementRevokeBansRequest  

PFAccountManagementRevokeBansRequest data model. Setting the active state of all bans requested to Inactive regardless of whether that ban has already expired. BanIds that do not exist will be skipped. Returns information about applied updates only. .  

## Syntax  
  
```cpp
typedef struct PFAccountManagementRevokeBansRequest {  
    const char* const* banIds;  
    uint32_t banIdsCount;  
} PFAccountManagementRevokeBansRequest;  
```
  
### Members  
  
**`banIds`** &nbsp; const char* const*  
  
Ids of the bans to be revoked. Maximum 100.
  
**`banIdsCount`** &nbsp; uint32_t  
  
Count of banIds
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
