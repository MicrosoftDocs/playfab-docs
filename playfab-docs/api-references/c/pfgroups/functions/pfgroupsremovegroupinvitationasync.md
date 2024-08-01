---
author: jasonsandlin
title: "PFGroupsRemoveGroupInvitationAsync"
description: "Removes an invitation join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsRemoveGroupInvitationAsync  

Removes an invitation join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsRemoveGroupInvitationAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsRemoveGroupInvitationRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsRemoveGroupInvitationRequest*](../../pfgroupstypes/structs/pfgroupsremovegroupinvitationrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Removes an existing invitation to join the group. This is used for both rejection of an invitation as well as rescinding an invitation. The invited entity or a parent in its chain (e.g. title) may reject the invitation by calling this method, and any caller with appropriate access in the group may rescind an invitation. No data is returned in the case of success. See also GroupAcceptGroupInvitationAsync, GroupInviteToGroupAsync, GroupListGroupInvitationsAsync, GroupListMembershipOpportunitiesAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_GROUP_INVITATION_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
