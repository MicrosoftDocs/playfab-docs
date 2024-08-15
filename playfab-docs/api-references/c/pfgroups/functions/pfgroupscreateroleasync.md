---
author: jasonsandlin
title: "PFGroupsCreateRoleAsync"
description: "Creates a new group role."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsCreateRoleAsync  

Creates a new group role.  

## Syntax  
  
```cpp
HRESULT PFGroupsCreateRoleAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsCreateGroupRoleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsCreateGroupRoleRequest*](../../pfgroupstypes/structs/pfgroupscreategrouprolerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Creates a new role within an existing group, with no members. Both the role ID and role name must be unique within the group, but the name can be the same as the ID. The role ID is set at creation and cannot be changed. Returns information about the role that was created. See also GroupDeleteRoleAsync. When the asynchronous task is complete, call [PFGroupsCreateRoleGetResultSize](pfgroupscreaterolegetresultsize.md) and [PFGroupsCreateRoleGetResult](pfgroupscreaterolegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
