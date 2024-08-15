---
author: jasonsandlin
title: "PFAccountManagementRevokeAllBansForUserRequest"
description: "PFAccountManagementRevokeAllBansForUserRequest data model. Setting the active state of all non-expired bans for a user to Inactive. Expired bans with an Active state will be ignored, however. Returns information about applied updates only."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementRevokeAllBansForUserRequest  

PFAccountManagementRevokeAllBansForUserRequest data model. Setting the active state of all non-expired bans for a user to Inactive. Expired bans with an Active state will be ignored, however. Returns information about applied updates only.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementRevokeAllBansForUserRequest {  
    const char* playFabId;  
} PFAccountManagementRevokeAllBansForUserRequest;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
