---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromGoogleIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Google identifiers. The Google identifiers are the IDs for the user accounts, available as 'id' in the Google+ People API calls."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromGoogleIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Google identifiers. The Google identifiers are the IDs for the user accounts, available as 'id' in the Google+ People API calls.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromGoogleIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromgoogleidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, Android, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromGoogleIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromgoogleidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromGoogleIDsGetResult](pfaccountmanagementclientgetplayfabidsfromgoogleidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
