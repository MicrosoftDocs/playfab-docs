---
author: jasonsandlin
title: "PFGroupsGetGroupAsync"
description: "Gets information about a group and its roles"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsGetGroupAsync  

Gets information about a group and its roles  

## Syntax  
  
```cpp
HRESULT PFGroupsGetGroupAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsGetGroupRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsGetGroupRequest*](../../pfgroupstypes/structs/pfgroupsgetgrouprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Returns the ID, name, role list and other non-membership related information about a group. See also GroupUpdateGroupAsync. If successful, call [PFGroupsGetGroupGetResult](pfgroupsgetgroupgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
