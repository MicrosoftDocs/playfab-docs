---
author: jasonsandlin
title: "PFGroupsUnblockEntityAsync"
description: "Unblocks a list of entities from joining a group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsUnblockEntityAsync  

Unblocks a list of entities from joining a group  

## Syntax  
  
```cpp
HRESULT PFGroupsUnblockEntityAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsUnblockEntityRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsUnblockEntityRequest*](../../pfgroupstypes/structs/pfgroupsunblockentityrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Unblocks a list of entities from joining a group. No data is returned in the case of success. See also GroupBlockEntityAsync, GroupListGroupBlocksAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
