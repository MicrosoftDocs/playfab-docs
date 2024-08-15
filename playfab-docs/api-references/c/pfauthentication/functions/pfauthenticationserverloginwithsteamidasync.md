---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithSteamIdAsync"
description: "Signs the user in using an Steam ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationServerLoginWithSteamIdAsync  

Signs the user in using an Steam ID, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithSteamIdAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const char* secretKey,  
    const PFAuthenticationLoginWithSteamIdRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`secretKey`** &nbsp; char*  
*_In_z_*  
  
Title Secret Key used to authenticate the service request.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithSteamIdRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithsteamidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. If this is the first time a user has signed in with the Steam ID and CreateAccount is set to true, a new PlayFab account will be created and linked to the Steam account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Steam users that are not logged into the Steam Client app will only have their Steam username synced, other data, such as currency and country will not be available until they login while the Client is open. When the asynchronous task is complete, call [PFAuthenticationServerLoginWithSteamIdGetResult](pfauthenticationserverloginwithsteamidgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
