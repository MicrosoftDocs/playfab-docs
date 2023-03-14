---
author: jasonsandlin
title: "PFGroupsAcceptGroupApplicationAsync"
description: "Accepts an outstanding invitation to to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsAcceptGroupApplicationAsync  

Accepts an outstanding invitation to to join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsAcceptGroupApplicationAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsAcceptGroupApplicationRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsAcceptGroupApplicationRequest*](../../pfgroupstypes/structs/pfgroupsacceptgroupapplicationrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Accepts an outstanding invitation to to join a group if the invited entity is not blocked by the group. Nothing is returned in the case of success. See also GroupApplyToGroupAsync, GroupListGroupApplicationsAsync, GroupRemoveGroupApplicationAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
