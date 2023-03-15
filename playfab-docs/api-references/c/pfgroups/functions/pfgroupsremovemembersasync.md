---
author: jasonsandlin
title: "PFGroupsRemoveMembersAsync"
description: "Removes members from a group."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Removes members from a group. A member can always remove themselves from a group, regardless of permissions. Returns nothing if successful. See also GroupAddMembersAsync, GroupListGroupMembersAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
