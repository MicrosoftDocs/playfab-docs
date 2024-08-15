---
author: jasonsandlin
title: "PFGroupsApplyToGroupAsync"
description: "Applies to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsApplyToGroupAsync  

Applies to join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsApplyToGroupAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsApplyToGroupRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsApplyToGroupRequest*](../../pfgroupstypes/structs/pfgroupsapplytogrouprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Creates an application to join a group. Calling this while a group application already exists will return the same application instead of an error and will not refresh the time before the application expires. By default, if the entity has an invitation to join the group outstanding, this will accept the invitation to join the group instead and return an error indicating such, rather than creating a duplicate application to join that will need to be cleaned up later. Returns information about the application or an error indicating an invitation was accepted instead. See also GroupAcceptGroupApplicationAsync, GroupListGroupApplicationsAsync, GroupRemoveGroupApplicationAsync. When the asynchronous task is complete, call [PFGroupsApplyToGroupGetResultSize](pfgroupsapplytogroupgetresultsize.md) and [PFGroupsApplyToGroupGetResult](pfgroupsapplytogroupgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
