---
author: jasonsandlin
title: "PFGroupsListMembershipOpportunitiesRequest"
description: "PFGroupsListMembershipOpportunitiesRequest data model. Lists all outstanding group applications and invitations for an entity. Anyone may call this for any entity, but data will only be returned for the entity or a parent of that entity. To list invitations or applications for a group to check if a player is trying to join, use ListGroupInvitations and ListGroupApplications."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListMembershipOpportunitiesRequest  

PFGroupsListMembershipOpportunitiesRequest data model. Lists all outstanding group applications and invitations for an entity. Anyone may call this for any entity, but data will only be returned for the entity or a parent of that entity. To list invitations or applications for a group to check if a player is trying to join, use ListGroupInvitations and ListGroupApplications.  

## Syntax  
  
```cpp
typedef struct PFGroupsListMembershipOpportunitiesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
} PFGroupsListMembershipOpportunitiesRequest;  
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

  
  
