---
author: jasonsandlin
title: "PFAccountManagementGetUserBansRequest"
description: "PFAccountManagementGetUserBansRequest data model. Get all bans for a user, including inactive and expired bans. ."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetUserBansRequest  

PFAccountManagementGetUserBansRequest data model. Get all bans for a user, including inactive and expired bans. .  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetUserBansRequest {  
    const char* playFabId;  
} PFAccountManagementGetUserBansRequest;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
