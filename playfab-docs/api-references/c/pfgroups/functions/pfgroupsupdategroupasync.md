---
author: jasonsandlin
title: "PFGroupsUpdateGroupAsync"
description: "Updates non-membership data about a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsUpdateGroupAsync  

Updates non-membership data about a group.  

## Syntax  
  
```cpp
HRESULT PFGroupsUpdateGroupAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsUpdateGroupRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsUpdateGroupRequest*](../../pfgroupstypes/structs/pfgroupsupdategrouprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Updates data about a group, such as the name or default member role. Returns information about whether the update was successful. Only title claimants may modify the administration role for a group. See also GroupCreateGroupAsync, GroupDeleteGroupAsync, GroupGetGroupAsync. When the asynchronous task is complete, call [PFGroupsUpdateGroupGetResultSize](pfgroupsupdategroupgetresultsize.md) and [PFGroupsUpdateGroupGetResult](pfgroupsupdategroupgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
