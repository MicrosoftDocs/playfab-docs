---
author: jasonsandlin
title: "PFGroupsAcceptGroupInvitationAsync"
description: "Accepts an invitation to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Accepts an outstanding invitation to join the group if the invited entity is not blocked by the group. Only the invited entity or a parent in its chain (e.g. title) may accept the invitation on the invited entity's behalf. Nothing is returned in the case of success. See also GroupInviteToGroupAsync, GroupListGroupInvitationsAsync, GroupListMembershipOpportunitiesAsync, GroupRemoveGroupInvitationAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
