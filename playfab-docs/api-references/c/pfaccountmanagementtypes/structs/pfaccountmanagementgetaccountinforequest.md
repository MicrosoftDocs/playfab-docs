---
author: jasonsandlin
title: "PFAccountManagementGetAccountInfoRequest"
description: "PFAccountManagementGetAccountInfoRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetAccountInfoRequest  

PFAccountManagementGetAccountInfoRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetAccountInfoRequest {  
    const char* email;  
    const char* playFabId;  
    const char* titleDisplayName;  
    const char* username;  
} PFAccountManagementGetAccountInfoRequest;  
```
  
### Members  
  
**`email`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) User email address for the account to find (if no Username is specified).
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier of the user whose info is being requested. Optional, defaults to the authenticated user if no other lookup identifier set.
  
**`titleDisplayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title-specific username for the account to find (if no Email is set). Note that if the non-unique Title Display Names option is enabled for the title, attempts to look up users by Title Display Name will always return AccountNotFound.
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab Username for the account to find (if no PlayFabId is specified).
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
