---
author: jasonsandlin
title: "PFGroupsAddMembersRequest"
description: "PFGroupsAddMembersRequest data model. Adds members to a group or role. Existing members of the group will added to roles within the group, but if the user is not already a member of the group, only title claimants may add them to the group, and others must use the group application or invite system to add new members to a group. Returns nothing if successful."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsAddMembersRequest  

PFGroupsAddMembersRequest data model. Adds members to a group or role. Existing members of the group will added to roles within the group, but if the user is not already a member of the group, only title claimants may add them to the group, and others must use the group application or invite system to add new members to a group. Returns nothing if successful.  

## Syntax  
  
```cpp
typedef struct PFGroupsAddMembersRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
    PFEntityKey const* members;  
    uint32_t membersCount;  
    const char* roleId;  
} PFGroupsAddMembersRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`members`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*array of size `membersCount`*  
  
List of entities to add to the group. Only entities of type title_player_account and character may be added to groups.
  
**`membersCount`** &nbsp; uint32_t  
  
Count of members
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional: The ID of the existing role to add the entities to. If this is not specified, the default member role for the group will be used. Role IDs must be between 1 and 64 characters long.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
