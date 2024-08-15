---
author: jasonsandlin
title: "PFGroupsListGroupInvitationsResponse"
description: "PFGroupsListGroupInvitationsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupInvitationsResponse  

PFGroupsListGroupInvitationsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupInvitationsResponse {  
    PFGroupsGroupInvitation const* invitations;  
    uint32_t invitationsCount;  
} PFGroupsListGroupInvitationsResponse;  
```
  
### Members  
  
**`invitations`** &nbsp; [PFGroupsGroupInvitation](pfgroupsgroupinvitation.md) const*  
*may be nullptr*  
  
(Optional) The requested list of group invitations.
  
**`invitationsCount`** &nbsp; uint32_t  
  
Count of invitations
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
