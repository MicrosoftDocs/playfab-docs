---
author: jasonsandlin
title: "PFAccountManagementClientReportPlayerAsync"
description: "Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title can take action concerning potentially toxic players."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementClientReportPlayerAsync  

Submit a report for another player (due to bad bahavior, etc.), so that customer service representatives for the title can take action concerning potentially toxic players.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientReportPlayerAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementReportPlayerClientRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFTitlePlayerHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementReportPlayerClientRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementreportplayerclientrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFAccountManagementClientReportPlayerGetResult](pfaccountmanagementclientreportplayergetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
