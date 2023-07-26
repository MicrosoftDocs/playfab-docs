---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of PlayStation :tm: Network identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfrompsnaccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Sony PlayStation®. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfrompsnaccountidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromPSNAccountIDsGetResult](pfaccountmanagementclientgetplayfabidsfrompsnaccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
