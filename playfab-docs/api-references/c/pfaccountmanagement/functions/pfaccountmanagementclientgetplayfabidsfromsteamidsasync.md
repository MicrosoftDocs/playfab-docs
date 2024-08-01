---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromSteamIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromSteamIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Steam identifiers. The Steam identifiers are the profile IDs for the user accounts, available as SteamId in the Steamworks Community API calls.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromSteamIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromSteamIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromSteamIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromsteamidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromSteamIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromsteamidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromSteamIDsGetResult](pfaccountmanagementclientgetplayfabidsfromsteamidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
