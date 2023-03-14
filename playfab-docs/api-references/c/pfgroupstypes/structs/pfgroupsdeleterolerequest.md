---
author: jasonsandlin
title: "PFGroupsDeleteRoleRequest"
description: "PFGroupsDeleteRoleRequest data model. Returns information about the role."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsDeleteRoleRequest  

PFGroupsDeleteRoleRequest data model. Returns information about the role.  

## Syntax  
  
```cpp
typedef struct PFGroupsDeleteRoleRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
    const char* roleId;  
} PFGroupsDeleteRoleRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the role to delete. Role IDs must be between 1 and 64 characters long.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
