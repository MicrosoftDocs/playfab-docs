---
author: jasonsandlin
title: "PFGroupsChangeMemberRoleAsync"
description: "Changes the role membership of a list of entities from one role to another."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Changes the role membership of a list of entities from one role to another in in a single operation. The destination role must already exist. This is equivalent to adding the entities to the destination role and removing from the origin role. Returns nothing if successful. See also GroupAddMembersAsync, GroupCreateRoleAsync, GroupRemoveMembersAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
