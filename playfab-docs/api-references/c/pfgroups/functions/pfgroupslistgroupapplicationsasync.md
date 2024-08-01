---
author: jasonsandlin
title: "PFGroupsListGroupApplicationsAsync"
description: "Lists all outstanding requests to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupApplicationsAsync  

Lists all outstanding requests to join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsListGroupApplicationsAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsListGroupApplicationsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsListGroupApplicationsRequest*](../../pfgroupstypes/structs/pfgroupslistgroupapplicationsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Lists all outstanding requests to join a group. Returns a list of all requests to join, as well as when the request will expire. To get the group applications for a specific entity, use ListMembershipOpportunities. See also GroupAcceptGroupApplicationAsync, GroupApplyToGroupAsync, GroupRemoveGroupApplicationAsync. When the asynchronous task is complete, call [PFGroupsListGroupApplicationsGetResultSize](pfgroupslistgroupapplicationsgetresultsize.md) and [PFGroupsListGroupApplicationsGetResult](pfgroupslistgroupapplicationsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
