---
author: jasonsandlin
title: "PFPlayerDataManagementClientUpdateUserDataGetResult"
description: "Gets the result of a successful PFPlayerDataManagementClientUpdateUserDataAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementClientUpdateUserDataGetResult  

Gets the result of a successful PFPlayerDataManagementClientUpdateUserDataAsync call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientUpdateUserDataGetResult(  
    XAsyncBlock* async,  
    PFPlayerDataManagementUpdateUserDataResult* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFPlayerDataManagementUpdateUserDataResult*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementupdateuserdataresult.md)  
*output*  
  
PFPlayerDataManagementUpdateUserDataResult object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
