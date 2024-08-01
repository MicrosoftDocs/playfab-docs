---
author: jasonsandlin
title: "PFTitleDataManagementServerGetTimeGetResult"
description: "Gets the result of a successful PFTitleDataManagementServerGetTimeAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementServerGetTimeGetResult  

Gets the result of a successful PFTitleDataManagementServerGetTimeAsync call.  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementServerGetTimeGetResult(  
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

  
  
