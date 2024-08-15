---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromNintendoServiceAccountIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Nintendo Service Account identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetPlayFabIDsFromNintendoServiceAccountIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Nintendo Service Account identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromNintendoServiceAccountIdsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromnintendoserviceaccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromNintendoServiceAccountIdsGetResultSize](pfaccountmanagementservergetplayfabidsfromnintendoserviceaccountidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromNintendoServiceAccountIdsGetResult](pfaccountmanagementservergetplayfabidsfromnintendoserviceaccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
