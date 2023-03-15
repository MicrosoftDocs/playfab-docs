---
author: jasonsandlin
title: "PFGroupsDeleteRoleAsync"
description: "Deletes an existing role in a group."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Returns information about the role See also GroupCreateRoleAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
