---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromSteamNamesAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are persona names."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientGetPlayFabIDsFromSteamNamesAsync  

Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are persona names.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromSteamNamesAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromSteamNamesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromSteamNamesRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromsteamnamesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromSteamNamesGetResultSize](pfaccountmanagementclientgetplayfabidsfromsteamnamesgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromSteamNamesGetResult](pfaccountmanagementclientgetplayfabidsfromsteamnamesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
