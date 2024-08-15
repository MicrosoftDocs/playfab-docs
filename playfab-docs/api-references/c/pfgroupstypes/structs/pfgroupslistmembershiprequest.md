---
author: jasonsandlin
title: "PFGroupsListMembershipRequest"
description: "PFGroupsListMembershipRequest data model. Lists the groups and roles that an entity is a part of, checking to see if group and role metadata and memberships should be visible to the caller. If the entity is not in any roles that are visible to the caller, the group is not returned in the results, even if the caller otherwise has permission to see that the entity is a member of that group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListMembershipRequest  

PFGroupsListMembershipRequest data model. Lists the groups and roles that an entity is a part of, checking to see if group and role metadata and memberships should be visible to the caller. If the entity is not in any roles that are visible to the caller, the group is not returned in the results, even if the caller otherwise has permission to see that the entity is a member of that group.  

## Syntax  
  
```cpp
typedef struct PFGroupsListMembershipRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFGroupsListMembershipRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
