---
author: jasonsandlin
title: "PFGroupsAcceptGroupApplicationRequest"
description: "PFGroupsAcceptGroupApplicationRequest data model. Accepts an outstanding invitation to to join a group if the invited entity is not blocked by the group. Nothing is returned in the case of success."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsAcceptGroupApplicationRequest  

PFGroupsAcceptGroupApplicationRequest data model. Accepts an outstanding invitation to to join a group if the invited entity is not blocked by the group. Nothing is returned in the case of success.  

## Syntax  
  
```cpp
typedef struct PFGroupsAcceptGroupApplicationRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
} PFGroupsAcceptGroupApplicationRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
Type of the entity to accept as. Must be the same entity as the claimant or an entity that is a child of the claimant entity.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
