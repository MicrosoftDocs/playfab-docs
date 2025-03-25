---
author: jasonsandlin
title: "PFGroupsGroupRole"
description: "PFGroupsGroupRole data model. Describes a group role."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFGroupsGroupRole  

PFGroupsGroupRole data model. Describes a group role.  

## Syntax  
  
```cpp
typedef struct PFGroupsGroupRole {  
    const char* roleId;  
    const char* roleName;  
} PFGroupsGroupRole;  
```
  
### Members  
  
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

  
  
