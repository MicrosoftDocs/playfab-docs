---
author: jasonsandlin
title: "PFAccountManagementClientReportPlayerGetResult"
description: "Gets the result of a successful PFAccountManagementClientReportPlayerAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientReportPlayerGetResult  

Gets the result of a successful PFAccountManagementClientReportPlayerAsync call.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientReportPlayerGetResult(  
    XAsyncBlock* async,  
    PFAccountManagementReportPlayerClientResult* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFAccountManagementReportPlayerClientResult*](../../pfaccountmanagementtypes/structs/pfaccountmanagementreportplayerclientresult.md)  
*output*  
  
PFAccountManagementReportPlayerClientResult object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
