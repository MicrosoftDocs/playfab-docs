---
author: jasonsandlin
title: "PFTitleDataManagementClientGetTimeAsync"
description: "Retrieves the current server time"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFTitleDataManagementClientGetTimeAsync  

Retrieves the current server time  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementClientGetTimeAsync(  
    PFEntityHandle entityHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFTitlePlayerHandle to use for authentication.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This query retrieves the current time from one of the servers in PlayFab. Please note that due to clock drift between servers, there is a potential variance of up to 5 seconds. If successful, call [PFTitleDataManagementClientGetTimeGetResult](pftitledatamanagementclientgettimegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
