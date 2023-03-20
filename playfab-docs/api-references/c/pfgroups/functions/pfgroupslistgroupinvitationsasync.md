---
author: jasonsandlin
title: "PFGroupsListGroupInvitationsAsync"
description: "Lists all outstanding invitations for a group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListGroupInvitationsAsync  

Lists all outstanding invitations for a group  

## Syntax  
  
```cpp
HRESULT PFGroupsListGroupInvitationsAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsListGroupInvitationsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsListGroupInvitationsRequest*](../../pfgroupstypes/structs/pfgroupslistgroupinvitationsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Lists all outstanding invitations for a group. Returns a list of entities that have been invited, as well as when the invitation will expire. To get the group invitations for a specific entity, use ListMembershipOpportunities. See also GroupAcceptGroupInvitationAsync, GroupInviteToGroupAsync, GroupListMembershipOpportunitiesAsync, GroupRemoveGroupInvitationAsync. If successful, call [PFGroupsListGroupInvitationsGetResult](pfgroupslistgroupinvitationsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
