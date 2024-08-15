---
author: jasonsandlin
title: "PFGroupsRemoveMembersRequest"
description: "PFGroupsRemoveMembersRequest data model. Removes members from a group. A member can always remove themselves from a group, regardless of permissions. Returns nothing if successful."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsRemoveMembersRequest  

PFGroupsRemoveMembersRequest data model. Removes members from a group. A member can always remove themselves from a group, regardless of permissions. Returns nothing if successful.  

## Syntax  
  
```cpp
typedef struct PFGroupsRemoveMembersRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
    PFEntityKey const* members;  
    uint32_t membersCount;  
    const char* roleId;  
} PFGroupsRemoveMembersRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`members`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
List of entities to remove.
  
**`membersCount`** &nbsp; uint32_t  
  
Count of members
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the role to remove the entities from.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
