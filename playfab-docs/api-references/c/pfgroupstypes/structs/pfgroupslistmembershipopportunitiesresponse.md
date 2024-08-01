---
author: jasonsandlin
title: "PFGroupsListMembershipOpportunitiesResponse"
description: "PFGroupsListMembershipOpportunitiesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListMembershipOpportunitiesResponse  

PFGroupsListMembershipOpportunitiesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsListMembershipOpportunitiesResponse {  
    PFGroupsGroupApplication const* applications;  
    uint32_t applicationsCount;  
    PFGroupsGroupInvitation const* invitations;  
    uint32_t invitationsCount;  
} PFGroupsListMembershipOpportunitiesResponse;  
```
  
### Members  
  
**`applications`** &nbsp; [PFGroupsGroupApplication](pfgroupsgroupapplication.md) const*  
*may be nullptr*  
  
(Optional) The requested list of group applications.
  
**`applicationsCount`** &nbsp; uint32_t  
  
Count of applications
  
**`invitations`** &nbsp; [PFGroupsGroupInvitation](pfgroupsgroupinvitation.md) const*  
*may be nullptr*  
  
(Optional) The requested list of group invitations.
  
**`invitationsCount`** &nbsp; uint32_t  
  
Count of invitations
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
