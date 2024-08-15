---
author: jasonsandlin
title: "PFGroupsInviteToGroupRequest"
description: "PFGroupsInviteToGroupRequest data model. Invites a player to join a group, if they are not blocked by the group. An optional role can be provided to automatically assign the player to the role if they accept the invitation. By default, if the entity has an application to the group outstanding, this will accept the application instead and return an error indicating such, rather than creating a duplicate invitation to join that will need to be cleaned up later. Returns information about the new invitation or an error indicating an existing application to join was accepted."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsInviteToGroupRequest  

PFGroupsInviteToGroupRequest data model. Invites a player to join a group, if they are not blocked by the group. An optional role can be provided to automatically assign the player to the role if they accept the invitation. By default, if the entity has an application to the group outstanding, this will accept the application instead and return an error indicating such, rather than creating a duplicate invitation to join that will need to be cleaned up later. Returns information about the new invitation or an error indicating an existing application to join was accepted.  

## Syntax  
  
```cpp
typedef struct PFGroupsInviteToGroupRequest {  
    bool const* autoAcceptOutstandingApplication;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
    const char* roleId;  
} PFGroupsInviteToGroupRequest;  
```
  
### Members  
  
**`autoAcceptOutstandingApplication`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Optional, default true. Automatically accept an application if one exists instead of creating an invitation.
  
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
  
(Optional) Optional. ID of an existing a role in the group to assign the user to. The group's default member role is used if this is not specified. Role IDs must be between 1 and 64 characters long.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
