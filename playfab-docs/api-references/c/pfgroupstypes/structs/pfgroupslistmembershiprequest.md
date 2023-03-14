---
author: jasonsandlin
title: "PFGroupsListMembershipRequest"
description: "PFGroupsListMembershipRequest data model. Lists the groups and roles that an entity is a part of, checking to see if group and role metadata and memberships should be visible to the caller. If the entity is not in any roles that are visible to the caller, the group is not returned in the results, even if the caller otherwise has permission to see that the entity is a member of that group."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListMembershipRequest  

PFGroupsListMembershipRequest data model. Lists the groups and roles that an entity is a part of, checking to see if group and role metadata and memberships should be visible to the caller. If the entity is not in any roles that are visible to the caller, the group is not returned in the results, even if the caller otherwise has permission to see that the entity is a member of that group.  

## Syntax  
  
```cpp
typedef struct PFGroupsListMembershipRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFGroupsListMembershipRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
