---
author: jasonsandlin
title: "PFGroupsIsMemberGetResult"
description: "Gets the result of a successful PFGroupsIsMemberAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsIsMemberGetResult  

Gets the result of a successful PFGroupsIsMemberAsync call.  

## Syntax  
  
```cpp
HRESULT PFGroupsIsMemberGetResult(  
    XAsyncBlock* async,  
    PFGroupsIsMemberResponse* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFGroupsIsMemberResponse*](../../pfgroupstypes/structs/pfgroupsismemberresponse.md)  
*output*  
  
PFGroupsIsMemberResponse object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ROLE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
