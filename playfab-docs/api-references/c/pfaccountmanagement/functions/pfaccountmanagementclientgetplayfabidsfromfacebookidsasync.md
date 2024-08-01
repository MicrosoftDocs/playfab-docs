---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromFacebookIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromFacebookIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Facebook identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromFacebookIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromfacebookidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, Android, iOS, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromFacebookIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromfacebookidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromFacebookIDsGetResult](pfaccountmanagementclientgetplayfabidsfromfacebookidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
