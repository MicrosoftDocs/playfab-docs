---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromFacebookInstantGamesIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Game identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromFacebookInstantGamesIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Game identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromFacebookInstantGamesIdsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromfacebookinstantgamesidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromFacebookInstantGamesIdsGetResultSize](pfaccountmanagementclientgetplayfabidsfromfacebookinstantgamesidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromFacebookInstantGamesIdsGetResult](pfaccountmanagementclientgetplayfabidsfromfacebookinstantgamesidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
