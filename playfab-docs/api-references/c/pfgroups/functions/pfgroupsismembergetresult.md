---
author: jasonsandlin
title: "PFGroupsIsMemberGetResult"
description: "Gets the result of a successful PFGroupsIsMemberAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
