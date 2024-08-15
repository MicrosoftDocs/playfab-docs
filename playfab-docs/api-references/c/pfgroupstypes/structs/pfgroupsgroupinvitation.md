---
author: jasonsandlin
title: "PFGroupsGroupInvitation"
description: "PFGroupsGroupInvitation data model. Describes an invitation to a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsGroupInvitation  

PFGroupsGroupInvitation data model. Describes an invitation to a group.  

## Syntax  
  
```cpp
typedef struct PFGroupsGroupInvitation {  
    time_t expires;  
    PFEntityKey const* group;  
    PFGroupsEntityWithLineage const* invitedByEntity;  
    PFGroupsEntityWithLineage const* invitedEntity;  
    const char* roleId;  
} PFGroupsGroupInvitation;  
```
  
### Members  
  
**`expires`** &nbsp; time_t  
  
When the invitation will expire and be deleted.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The group that the entity invited to.
  
**`invitedByEntity`** &nbsp; [PFGroupsEntityWithLineage](pfgroupsentitywithlineage.md) const*  
*may be nullptr*  
  
(Optional) The entity that created the invitation.
  
**`invitedEntity`** &nbsp; [PFGroupsEntityWithLineage](pfgroupsentitywithlineage.md) const*  
*may be nullptr*  
  
(Optional) The entity that is invited.
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ID of the role in the group to assign the user to.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
