---
author: jasonsandlin
title: "PFGroupsBlockEntityAsync"
description: "Blocks a list of entities from joining a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsBlockEntityAsync  

Blocks a list of entities from joining a group.  

## Syntax  
  
```cpp
HRESULT PFGroupsBlockEntityAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsBlockEntityRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsBlockEntityRequest*](../../pfgroupstypes/structs/pfgroupsblockentityrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Blocks a list of entities from joining a group. Blocked entities may not create new applications to join, be invited to join, accept an invitation, or have an application accepted. Failure due to being blocked does not clean up existing applications or invitations to the group. No data is returned in the case of success. See also GroupListGroupBlocksAsync, GroupUnblockEntityAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
