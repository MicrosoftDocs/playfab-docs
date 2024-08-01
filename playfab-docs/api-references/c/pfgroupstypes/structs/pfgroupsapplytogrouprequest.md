---
author: jasonsandlin
title: "PFGroupsApplyToGroupRequest"
description: "PFGroupsApplyToGroupRequest data model. Creates an application to join a group. Calling this while a group application already exists will return the same application instead of an error and will not refresh the time before the application expires. By default, if the entity has an invitation to join the group outstanding, this will accept the invitation to join the group instead and return an error indicating such, rather than creating a duplicate application to join that will need to be cleaned up later. Returns information about the application or an error indicating an invitation was accepted instead."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsApplyToGroupRequest  

PFGroupsApplyToGroupRequest data model. Creates an application to join a group. Calling this while a group application already exists will return the same application instead of an error and will not refresh the time before the application expires. By default, if the entity has an invitation to join the group outstanding, this will accept the invitation to join the group instead and return an error indicating such, rather than creating a duplicate application to join that will need to be cleaned up later. Returns information about the application or an error indicating an invitation was accepted instead.  

## Syntax  
  
```cpp
typedef struct PFGroupsApplyToGroupRequest {  
    bool const* autoAcceptOutstandingInvite;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
} PFGroupsApplyToGroupRequest;  
```
  
### Members  
  
**`autoAcceptOutstandingInvite`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Optional, default true. Automatically accept an outstanding invitation if one exists instead of creating an application.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
