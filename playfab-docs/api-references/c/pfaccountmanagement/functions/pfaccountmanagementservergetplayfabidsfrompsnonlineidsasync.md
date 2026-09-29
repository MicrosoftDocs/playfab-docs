---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromPSNOnlineIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementServerGetPlayFabIDsFromPSNOnlineIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromPSNOnlineIDsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfrompsnonlineidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromPSNOnlineIDsGetResultSize](pfaccountmanagementservergetplayfabidsfrompsnonlineidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromPSNOnlineIDsGetResult](pfaccountmanagementservergetplayfabidsfrompsnonlineidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
