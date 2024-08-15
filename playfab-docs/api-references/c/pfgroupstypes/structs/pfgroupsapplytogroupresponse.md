---
author: jasonsandlin
title: "PFGroupsApplyToGroupResponse"
description: "PFGroupsApplyToGroupResponse data model. Describes an application to join a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsApplyToGroupResponse  

PFGroupsApplyToGroupResponse data model. Describes an application to join a group.  

## Syntax  
  
```cpp
typedef struct PFGroupsApplyToGroupResponse {  
    PFGroupsEntityWithLineage const* entity;  
    time_t expires;  
    PFEntityKey const* group;  
} PFGroupsApplyToGroupResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFGroupsEntityWithLineage](pfgroupsentitywithlineage.md) const*  
*may be nullptr*  
  
(Optional) Type of entity that requested membership.
  
**`expires`** &nbsp; time_t  
  
When the application to join will expire and be deleted.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) ID of the group that the entity requesting membership to.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
