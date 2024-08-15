---
author: jasonsandlin
title: "PFGroupsGetGroupAsync"
description: "Gets information about a group and its roles"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
  
This API is available on all platforms. Returns the ID, name, role list and other non-membership related information about a group. See also GroupUpdateGroupAsync. When the asynchronous task is complete, call [PFGroupsGetGroupGetResultSize](pfgroupsgetgroupgetresultsize.md) and [PFGroupsGetGroupGetResult](pfgroupsgetgroupgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
