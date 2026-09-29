---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromPSNOnlineIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientGetPlayFabIDsFromPSNOnlineIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromPSNOnlineIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfrompsnonlineidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromPSNOnlineIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfrompsnonlineidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromPSNOnlineIDsGetResult](pfaccountmanagementclientgetplayfabidsfrompsnonlineidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
