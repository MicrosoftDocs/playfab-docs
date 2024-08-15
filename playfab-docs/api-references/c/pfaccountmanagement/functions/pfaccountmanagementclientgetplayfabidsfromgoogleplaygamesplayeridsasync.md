---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromGooglePlayGamesPlayerIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Google Play Games identifiers. The Google Play Games identifiers are the IDs for the user accounts, available as 'playerId' in the Google Play Games Services - Players API calls."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromGooglePlayGamesPlayerIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Google Play Games identifiers. The Google Play Games identifiers are the IDs for the user accounts, available as 'playerId' in the Google Play Games Services - Players API calls.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromGooglePlayGamesPlayerIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromgoogleplaygamesplayeridsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, Android, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromGooglePlayGamesPlayerIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromgoogleplaygamesplayeridsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromGooglePlayGamesPlayerIDsGetResult](pfaccountmanagementclientgetplayfabidsfromgoogleplaygamesplayeridsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
