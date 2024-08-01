---
author: jasonsandlin
title: "PFTitleDataManagementClientGetTimeGetResult"
description: "Gets the result of a successful PFTitleDataManagementClientGetTimeAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_PUBLISHER_NOT_SET or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
