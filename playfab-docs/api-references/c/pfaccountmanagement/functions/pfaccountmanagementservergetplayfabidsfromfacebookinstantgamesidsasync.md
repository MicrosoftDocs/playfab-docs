---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromFacebookInstantGamesIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Games identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetPlayFabIDsFromFacebookInstantGamesIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Facebook Instant Games identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromFacebookInstantGamesIdsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromFacebookInstantGamesIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromfacebookinstantgamesidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromFacebookInstantGamesIdsGetResultSize](pfaccountmanagementservergetplayfabidsfromfacebookinstantgamesidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromFacebookInstantGamesIdsGetResult](pfaccountmanagementservergetplayfabidsfromfacebookinstantgamesidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
