---
author: jasonsandlin
title: "PFGroupsAcceptGroupInvitationRequest"
description: "PFGroupsAcceptGroupInvitationRequest data model. Accepts an outstanding invitation to join the group if the invited entity is not blocked by the group. Only the invited entity or a parent in its chain (e.g. title) may accept the invitation on the invited entity's behalf. Nothing is returned in the case of success."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsAcceptGroupInvitationRequest  

PFGroupsAcceptGroupInvitationRequest data model. Accepts an outstanding invitation to join the group if the invited entity is not blocked by the group. Only the invited entity or a parent in its chain (e.g. title) may accept the invitation on the invited entity's behalf. Nothing is returned in the case of success.  

## Syntax  
  
```cpp
typedef struct PFGroupsAcceptGroupInvitationRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
} PFGroupsAcceptGroupInvitationRequest;  
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
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
