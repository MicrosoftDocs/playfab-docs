---
author: jasonsandlin
title: "PFGroupsListGroupInvitationsRequest"
description: "PFGroupsListGroupInvitationsRequest data model. Lists all outstanding invitations for a group. Returns a list of entities that have been invited, as well as when the invitation will expire. To get the group invitations for a specific entity, use ListMembershipOpportunities."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupInvitationsRequest  

PFGroupsListGroupInvitationsRequest data model. Lists all outstanding invitations for a group. Returns a list of entities that have been invited, as well as when the invitation will expire. To get the group invitations for a specific entity, use ListMembershipOpportunities.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupInvitationsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupInvitationsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
