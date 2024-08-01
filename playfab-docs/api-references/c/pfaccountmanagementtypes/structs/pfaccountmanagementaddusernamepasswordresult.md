---
author: jasonsandlin
title: "PFAccountManagementAddUsernamePasswordResult"
description: "PFAccountManagementAddUsernamePasswordResult data model. Each account must have a unique username and email address in the PlayFab service. Once created, the account may be associated with additional accounts (Steam, Facebook, Game Center, etc.), allowing for added social network lists and achievements systems. This can also be used to provide a recovery method if the user loses their original means of access."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementAddUsernamePasswordResult  

PFAccountManagementAddUsernamePasswordResult data model. Each account must have a unique username and email address in the PlayFab service. Once created, the account may be associated with additional accounts (Steam, Facebook, Game Center, etc.), allowing for added social network lists and achievements systems. This can also be used to provide a recovery method if the user loses their original means of access.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementAddUsernamePasswordResult {  
    const char* username;  
} PFAccountManagementAddUsernamePasswordResult;  
```
  
### Members  
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab unique user name.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
