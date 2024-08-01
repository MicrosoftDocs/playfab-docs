---
author: jasonsandlin
title: "PFGroupsRemoveMembersAsync"
description: "Removes members from a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsRemoveMembersAsync  

Removes members from a group.  

## Syntax  
  
```cpp
HRESULT PFGroupsRemoveMembersAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsRemoveMembersRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsRemoveMembersRequest*](../../pfgroupstypes/structs/pfgroupsremovemembersrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Removes members from a group. A member can always remove themselves from a group, regardless of permissions. Returns nothing if successful. See also GroupAddMembersAsync, GroupListGroupMembersAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ROLE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
