---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Nintendo Service Account identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Nintendo Service Account identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromnintendoserviceaccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Nintendo Switch, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsGetResultSize](pfaccountmanagementclientgetplayfabidsfromnintendoserviceaccountidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromNintendoServiceAccountIdsGetResult](pfaccountmanagementclientgetplayfabidsfromnintendoserviceaccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
