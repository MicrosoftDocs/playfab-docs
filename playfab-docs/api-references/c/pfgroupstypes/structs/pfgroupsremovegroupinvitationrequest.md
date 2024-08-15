---
author: jasonsandlin
title: "PFGroupsRemoveGroupInvitationRequest"
description: "PFGroupsRemoveGroupInvitationRequest data model. Removes an existing invitation to join the group. This is used for both rejection of an invitation as well as rescinding an invitation. The invited entity or a parent in its chain (e.g. title) may reject the invitation by calling this method, and any caller with appropriate access in the group may rescind an invitation. No data is returned in the case of success."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsRemoveGroupInvitationRequest  

PFGroupsRemoveGroupInvitationRequest data model. Removes an existing invitation to join the group. This is used for both rejection of an invitation as well as rescinding an invitation. The invited entity or a parent in its chain (e.g. title) may reject the invitation by calling this method, and any caller with appropriate access in the group may rescind an invitation. No data is returned in the case of success.  

## Syntax  
  
```cpp
typedef struct PFGroupsRemoveGroupInvitationRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
} PFGroupsRemoveGroupInvitationRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
