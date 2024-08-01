---
author: jasonsandlin
title: "PFGroupsEntityMemberRole"
description: "PFGroupsEntityMemberRole data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsEntityMemberRole  

PFGroupsEntityMemberRole data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsEntityMemberRole {  
    PFGroupsEntityWithLineage const* members;  
    uint32_t membersCount;  
    const char* roleId;  
    const char* roleName;  
} PFGroupsEntityMemberRole;  
```
  
### Members  
  
**`members`** &nbsp; [PFGroupsEntityWithLineage](pfgroupsentitywithlineage.md) const*  
*may be nullptr*  
  
(Optional) The list of members in the role.
  
**`membersCount`** &nbsp; uint32_t  
  
Count of members
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the role.
  
**`roleName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the role.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
