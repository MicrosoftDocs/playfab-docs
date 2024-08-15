---
author: jasonsandlin
title: "PFGroupsDeleteRoleAsync"
description: "Deletes an existing role in a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsDeleteRoleAsync  

Deletes an existing role in a group.  

## Syntax  
  
```cpp
HRESULT PFGroupsDeleteRoleAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsDeleteRoleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsDeleteRoleRequest*](../../pfgroupstypes/structs/pfgroupsdeleterolerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Returns information about the role See also GroupCreateRoleAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ROLE_DOES_NOT_EXIST, E_PF_ROLE_IS_GROUP_ADMIN, E_PF_ROLE_IS_GROUP_DEFAULT_MEMBER or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
