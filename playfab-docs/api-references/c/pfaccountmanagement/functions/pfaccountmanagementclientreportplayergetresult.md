---
author: jasonsandlin
title: "PFAccountManagementClientReportPlayerGetResult"
description: "Gets the result of a successful PFAccountManagementClientReportPlayerAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
