---
author: jasonsandlin
title: "PFGroupsCreateGroupRoleResponse"
description: "PFGroupsCreateGroupRoleResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsCreateGroupRoleResponse  

PFGroupsCreateGroupRoleResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsCreateGroupRoleResponse {  
    int32_t profileVersion;  
    const char* roleId;  
    const char* roleName;  
} PFGroupsCreateGroupRoleResponse;  
```
  
### Members  
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the group profile, can be used for concurrency control during updates.
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ID for the role.
  
**`roleName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the role.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
