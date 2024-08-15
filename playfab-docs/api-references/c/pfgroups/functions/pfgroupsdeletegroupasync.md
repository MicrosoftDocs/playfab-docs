---
author: jasonsandlin
title: "PFGroupsDeleteGroupAsync"
description: "Deletes a group and all roles, invitations, join requests, and blocks associated with it."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsDeleteGroupAsync  

Deletes a group and all roles, invitations, join requests, and blocks associated with it.  

## Syntax  
  
```cpp
HRESULT PFGroupsDeleteGroupAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsDeleteGroupRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsDeleteGroupRequest*](../../pfgroupstypes/structs/pfgroupsdeletegrouprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Deletes a group and all roles, invitations, join requests, and blocks associated with it. Permission to delete is only required the group itself to execute this action. The group and data cannot be cannot be recovered once removed, but any abuse reports about the group will remain. No data is returned in the case of success. See also GroupCreateGroupAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
