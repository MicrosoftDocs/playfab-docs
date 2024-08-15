---
author: jasonsandlin
title: "PFGroupsAcceptGroupInvitationAsync"
description: "Accepts an invitation to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsAcceptGroupInvitationAsync  

Accepts an invitation to join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsAcceptGroupInvitationAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsAcceptGroupInvitationRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsAcceptGroupInvitationRequest*](../../pfgroupstypes/structs/pfgroupsacceptgroupinvitationrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Accepts an outstanding invitation to join the group if the invited entity is not blocked by the group. Only the invited entity or a parent in its chain (e.g. title) may accept the invitation on the invited entity's behalf. Nothing is returned in the case of success. See also GroupInviteToGroupAsync, GroupListGroupInvitationsAsync, GroupListMembershipOpportunitiesAsync, GroupRemoveGroupInvitationAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ENTITY_BLOCKED_BY_GROUP, E_PF_ENTITY_IS_ALREADY_MEMBER, E_PF_GROUP_INVITATION_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
