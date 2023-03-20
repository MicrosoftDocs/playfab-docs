---
author: jasonsandlin
title: "PFTitleDataManagementClientGetTimeGetResult"
description: "Gets the result of a successful PFTitleDataManagementClientGetTimeAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFTitleDataManagementClientGetTimeGetResult  

Gets the result of a successful PFTitleDataManagementClientGetTimeAsync call.  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementClientGetTimeGetResult(  
    XAsyncBlock* async,  
    PFTitleDataManagementGetTimeResult* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFTitleDataManagementGetTimeResult*](../../pftitledatamanagementtypes/structs/pftitledatamanagementgettimeresult.md)  
*output*  
  
PFTitleDataManagementGetTimeResult object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
