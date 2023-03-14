---
author: jasonsandlin
title: "PFGroupsListGroupMembersRequest"
description: "PFGroupsListGroupMembersRequest data model. Gets a list of members and the roles they belong to within the group. If the caller does not have permission to view the role, and the member is in no other role, the member is not displayed. Returns a list of entities that are members of the group."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListGroupMembersRequest  

PFGroupsListGroupMembersRequest data model. Gets a list of members and the roles they belong to within the group. If the caller does not have permission to view the role, and the member is in no other role, the member is not displayed. Returns a list of entities that are members of the group.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupMembersRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupMembersRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
ID of the group to list the members and roles for.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
