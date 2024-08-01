---
author: jasonsandlin
title: "PFGroupsCreateGroupAsync"
description: "Creates a new group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsCreateGroupAsync  

Creates a new group.  

## Syntax  
  
```cpp
HRESULT PFGroupsCreateGroupAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsCreateGroupRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsCreateGroupRequest*](../../pfgroupstypes/structs/pfgroupscreategrouprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Creates a new group, as well as administration and member roles, based off of a title's group template. Returns information about the group that was created. See also GroupAddMembersAsync, GroupApplyToGroupAsync, GroupDeleteGroupAsync, GroupInviteToGroupAsync, GroupListGroupMembersAsync, GroupRemoveMembersAsync. When the asynchronous task is complete, call [PFGroupsCreateGroupGetResultSize](pfgroupscreategroupgetresultsize.md) and [PFGroupsCreateGroupGetResult](pfgroupscreategroupgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
