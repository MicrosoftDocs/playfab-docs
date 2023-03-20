---
author: jasonsandlin
title: "PFGroupsListGroupBlocksAsync"
description: "Lists all entities blocked from joining a group"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListGroupBlocksAsync  

Lists all entities blocked from joining a group  

## Syntax  
  
```cpp
HRESULT PFGroupsListGroupBlocksAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsListGroupBlocksRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsListGroupBlocksRequest*](../../pfgroupstypes/structs/pfgroupslistgroupblocksrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Lists all entities blocked from joining a group. A list of blocked entities is returned See also GroupBlockEntityAsync, GroupUnblockEntityAsync. If successful, call [PFGroupsListGroupBlocksGetResult](pfgroupslistgroupblocksgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
