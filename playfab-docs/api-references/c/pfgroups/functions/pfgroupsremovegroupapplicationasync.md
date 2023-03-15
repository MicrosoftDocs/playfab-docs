---
author: jasonsandlin
title: "PFGroupsRemoveGroupApplicationAsync"
description: "Removes an application to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsRemoveGroupApplicationAsync  

Removes an application to join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsRemoveGroupApplicationAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsRemoveGroupApplicationRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsRemoveGroupApplicationRequest*](../../pfgroupstypes/structs/pfgroupsremovegroupapplicationrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Removes an existing application to join the group. This is used for both rejection of an application as well as withdrawing an application. The applying entity or a parent in its chain (e.g. title) may withdraw the application, and any caller with appropriate access in the group may reject an application. No data is returned in the case of success. See also GroupAcceptGroupApplicationAsync, GroupApplyToGroupAsync, GroupListGroupApplicationsAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
