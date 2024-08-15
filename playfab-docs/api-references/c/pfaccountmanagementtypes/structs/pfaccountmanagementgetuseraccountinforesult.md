---
author: jasonsandlin
title: "PFAccountManagementGetUserAccountInfoResult"
description: "PFAccountManagementGetUserAccountInfoResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetUserAccountInfoResult  

PFAccountManagementGetUserAccountInfoResult data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetUserAccountInfoResult {  
    PFUserAccountInfo const* userInfo;  
} PFAccountManagementGetUserAccountInfoResult;  
```
  
### Members  
  
**`userInfo`** &nbsp; [PFUserAccountInfo](../../pftypes/structs/pfuseraccountinfo.md) const*  
*may be nullptr*  
  
(Optional) Account details for the user whose information was requested.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
