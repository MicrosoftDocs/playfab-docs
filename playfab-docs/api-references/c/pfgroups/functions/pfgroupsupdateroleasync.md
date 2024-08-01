---
author: jasonsandlin
title: "PFGroupsUpdateRoleAsync"
description: "Updates metadata about a role."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsUpdateRoleAsync  

Updates metadata about a role.  

## Syntax  
  
```cpp
HRESULT PFGroupsUpdateRoleAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsUpdateGroupRoleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsUpdateGroupRoleRequest*](../../pfgroupstypes/structs/pfgroupsupdategrouprolerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Updates the role name. Returns information about whether the update was successful. See also GroupCreateRoleAsync, GroupDeleteRoleAsync. When the asynchronous task is complete, call [PFGroupsUpdateRoleGetResultSize](pfgroupsupdaterolegetresultsize.md) and [PFGroupsUpdateRoleGetResult](pfgroupsupdaterolegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
