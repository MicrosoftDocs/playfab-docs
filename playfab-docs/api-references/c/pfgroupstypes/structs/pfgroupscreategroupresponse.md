---
author: jasonsandlin
title: "PFGroupsCreateGroupResponse"
description: "PFGroupsCreateGroupResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsCreateGroupResponse  

PFGroupsCreateGroupResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsCreateGroupResponse {  
    const char* adminRoleId;  
    time_t created;  
    PFEntityKey const* group;  
    const char* groupName;  
    const char* memberRoleId;  
    int32_t profileVersion;  
    PFStringDictionaryEntry const* roles;  
    uint32_t rolesCount;  
} PFGroupsCreateGroupResponse;  
```
  
### Members  
  
**`adminRoleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the administrator role for the group.
  
**`created`** &nbsp; time_t  
  
The server date and time the group was created.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`groupName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the group.
  
**`memberRoleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the default member role for the group.
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
**`roles`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The list of roles and names that belong to the group.
  
**`rolesCount`** &nbsp; uint32_t  
  
Count of roles
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
