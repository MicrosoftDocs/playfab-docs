---
author: jasonsandlin
title: "PFTitleDataManagementServerGetTimeAsync"
description: "Retrieves the current server time"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementServerGetTimeAsync  

Retrieves the current server time  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementServerGetTimeAsync(  
    PFEntityHandle titleEntityHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This query retrieves the current time from one of the servers in PlayFab. Please note that due to clock drift between servers, there is a potential variance of up to 5 seconds. When the asynchronous task is complete, call [PFTitleDataManagementServerGetTimeGetResult](pftitledatamanagementservergettimegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
