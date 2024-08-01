---
author: jasonsandlin
title: "PFGroupsAddMembersAsync"
description: "Adds members to a group or role."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsAddMembersAsync  

Adds members to a group or role.  

## Syntax  
  
```cpp
HRESULT PFGroupsAddMembersAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsAddMembersRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsAddMembersRequest*](../../pfgroupstypes/structs/pfgroupsaddmembersrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Adds members to a group or role. Existing members of the group will added to roles within the group, but if the user is not already a member of the group, only title claimants may add them to the group, and others must use the group application or invite system to add new members to a group. Returns nothing if successful. See also GroupApplyToGroupAsync, GroupInviteToGroupAsync, GroupListGroupMembersAsync, GroupRemoveMembersAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ROLE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
