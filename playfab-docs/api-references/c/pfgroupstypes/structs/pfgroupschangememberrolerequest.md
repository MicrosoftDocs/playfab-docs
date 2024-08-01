---
author: jasonsandlin
title: "PFGroupsChangeMemberRoleRequest"
description: "PFGroupsChangeMemberRoleRequest data model. Changes the role membership of a list of entities from one role to another in in a single operation. The destination role must already exist. This is equivalent to adding the entities to the destination role and removing from the origin role. Returns nothing if successful."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsChangeMemberRoleRequest  

PFGroupsChangeMemberRoleRequest data model. Changes the role membership of a list of entities from one role to another in in a single operation. The destination role must already exist. This is equivalent to adding the entities to the destination role and removing from the origin role. Returns nothing if successful.  

## Syntax  
  
```cpp
typedef struct PFGroupsChangeMemberRoleRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* destinationRoleId;  
    PFEntityKey const* group;  
    PFEntityKey const* members;  
    uint32_t membersCount;  
    const char* originRoleId;  
} PFGroupsChangeMemberRoleRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`destinationRoleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the role that the entities will become a member of. This must be an existing role. Role IDs must be between 1 and 64 characters long.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`members`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
List of entities to move between roles in the group. All entities in this list must be members of the group and origin role.
  
**`membersCount`** &nbsp; uint32_t  
  
Count of members
  
**`originRoleId`** &nbsp; const char*  
*is null-terminated*  
  
The ID of the role that the entities currently are a member of. Role IDs must be between 1 and 64 characters long.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
