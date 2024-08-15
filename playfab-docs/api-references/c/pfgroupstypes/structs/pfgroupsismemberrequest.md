---
author: jasonsandlin
title: "PFGroupsIsMemberRequest"
description: "PFGroupsIsMemberRequest data model. Checks to see if an entity is a member of a group or role within the group. A result indicating if the entity is a member of the group is returned, or a permission error if the caller does not have permission to read the group's member list."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsIsMemberRequest  

PFGroupsIsMemberRequest data model. Checks to see if an entity is a member of a group or role within the group. A result indicating if the entity is a member of the group is returned, or a permission error if the caller does not have permission to read the group's member list.  

## Syntax  
  
```cpp
typedef struct PFGroupsIsMemberRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
    const char* roleId;  
} PFGroupsIsMemberRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional: ID of the role to check membership of. Defaults to any role (that is, check to see if the entity is a member of the group in any capacity) if not specified.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
