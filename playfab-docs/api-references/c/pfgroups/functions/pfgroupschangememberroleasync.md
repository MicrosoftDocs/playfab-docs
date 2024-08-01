---
author: jasonsandlin
title: "PFGroupsChangeMemberRoleAsync"
description: "Changes the role membership of a list of entities from one role to another."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsChangeMemberRoleAsync  

Changes the role membership of a list of entities from one role to another.  

## Syntax  
  
```cpp
HRESULT PFGroupsChangeMemberRoleAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsChangeMemberRoleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsChangeMemberRoleRequest*](../../pfgroupstypes/structs/pfgroupschangememberrolerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Changes the role membership of a list of entities from one role to another in in a single operation. The destination role must already exist. This is equivalent to adding the entities to the destination role and removing from the origin role. Returns nothing if successful. See also GroupAddMembersAsync, GroupCreateRoleAsync, GroupRemoveMembersAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ROLE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
