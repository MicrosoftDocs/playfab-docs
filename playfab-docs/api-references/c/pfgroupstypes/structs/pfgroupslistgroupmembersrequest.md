---
author: jasonsandlin
title: "PFGroupsListGroupMembersRequest"
description: "PFGroupsListGroupMembersRequest data model. Gets a list of members and the roles they belong to within the group. If the caller does not have permission to view the role, and the member is in no other role, the member is not displayed. Returns a list of entities that are members of the group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupMembersRequest  

PFGroupsListGroupMembersRequest data model. Gets a list of members and the roles they belong to within the group. If the caller does not have permission to view the role, and the member is in no other role, the member is not displayed. Returns a list of entities that are members of the group.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupMembersRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupMembersRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
ID of the group to list the members and roles for.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
