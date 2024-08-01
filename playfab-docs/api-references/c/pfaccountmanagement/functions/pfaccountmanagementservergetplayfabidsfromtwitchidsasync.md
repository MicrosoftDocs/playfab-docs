---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromTwitchIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Twitch identifiers. The Twitch identifiers are the IDs for the user accounts, available as '_id' from the Twitch API methods (ex: https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser)."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetPlayFabIDsFromTwitchIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Twitch identifiers. The Twitch identifiers are the IDs for the user accounts, available as '_id' from the Twitch API methods (ex: https://github.com/justintv/Twitch-API/blob/master/v3_resources/users.md#get-usersuser).  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromTwitchIDsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromTwitchIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromTwitchIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromtwitchidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromTwitchIDsGetResultSize](pfaccountmanagementservergetplayfabidsfromtwitchidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromTwitchIDsGetResult](pfaccountmanagementservergetplayfabidsfromtwitchidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
