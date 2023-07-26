---
author: jasonsandlin
title: "PFAccountManagementGetUserAccountInfoResult"
description: "PFAccountManagementGetUserAccountInfoResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/26/2023
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

  
  
