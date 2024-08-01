---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromPSNAccountIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetPlayFabIDsFromPSNAccountIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromPSNAccountIDsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfrompsnaccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromPSNAccountIDsGetResultSize](pfaccountmanagementservergetplayfabidsfrompsnaccountidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromPSNAccountIDsGetResult](pfaccountmanagementservergetplayfabidsfrompsnaccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
