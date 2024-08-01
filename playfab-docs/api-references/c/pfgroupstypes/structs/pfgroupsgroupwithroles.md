---
author: jasonsandlin
title: "PFGroupsGroupWithRoles"
description: "PFGroupsGroupWithRoles data model. Describes a group and the roles that it contains."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsGroupWithRoles  

PFGroupsGroupWithRoles data model. Describes a group and the roles that it contains.  

## Syntax  
  
```cpp
typedef struct PFGroupsGroupWithRoles {  
    PFEntityKey const* group;  
    const char* groupName;  
    int32_t profileVersion;  
    PFGroupsGroupRole const* roles;  
    uint32_t rolesCount;  
} PFGroupsGroupWithRoles;  
```
  
### Members  
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) ID for the group.
  
**`groupName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the group.
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
**`roles`** &nbsp; [PFGroupsGroupRole](pfgroupsgrouprole.md) const*  
*may be nullptr*  
  
(Optional) The list of roles within the group.
  
**`rolesCount`** &nbsp; uint32_t  
  
Count of roles
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
