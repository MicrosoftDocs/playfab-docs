---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromXboxLiveIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetPlayFabIDsFromXboxLiveIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromXboxLiveIDsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromxboxliveidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromXboxLiveIDsGetResultSize](pfaccountmanagementservergetplayfabidsfromxboxliveidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromXboxLiveIDsGetResult](pfaccountmanagementservergetplayfabidsfromxboxliveidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
