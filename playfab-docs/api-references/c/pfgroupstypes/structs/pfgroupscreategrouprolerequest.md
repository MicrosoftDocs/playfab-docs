---
author: jasonsandlin
title: "PFGroupsCreateGroupRoleRequest"
description: "PFGroupsCreateGroupRoleRequest data model. Creates a new role within an existing group, with no members. Both the role ID and role name must be unique within the group, but the name can be the same as the ID. The role ID is set at creation and cannot be changed. Returns information about the role that was created."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsCreateGroupRoleRequest  

PFGroupsCreateGroupRoleRequest data model. Creates a new role within an existing group, with no members. Both the role ID and role name must be unique within the group, but the name can be the same as the ID. The role ID is set at creation and cannot be changed. Returns information about the role that was created.  

## Syntax  
  
```cpp
typedef struct PFGroupsCreateGroupRoleRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
    const char* roleId;  
    const char* roleName;  
} PFGroupsCreateGroupRoleRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
The ID of the role. This must be unique within the group and cannot be changed. Role IDs must be between 1 and 64 characters long and are restricted to a-Z, A-Z, 0-9, '(', ')', '_', '-' and '.'.
  
**`roleName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the role. This must be unique within the group and can be changed later. Role names must be between 1 and 100 characters long.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
