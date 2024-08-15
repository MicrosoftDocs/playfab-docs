---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromxboxliveidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, GDK, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromxboxliveidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsGetResult](pfaccountmanagementclientgetplayfabidsfromxboxliveidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
