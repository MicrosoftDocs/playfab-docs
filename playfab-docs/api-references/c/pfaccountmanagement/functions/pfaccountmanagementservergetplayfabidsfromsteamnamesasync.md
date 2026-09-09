---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromSteamNamesAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are persona names."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementServerGetPlayFabIDsFromSteamNamesAsync  

Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are persona names.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromSteamNamesAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromSteamNamesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromSteamNamesRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromsteamnamesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromSteamNamesGetResultSize](pfaccountmanagementservergetplayfabidsfromsteamnamesgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromSteamNamesGetResult](pfaccountmanagementservergetplayfabidsfromsteamnamesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
