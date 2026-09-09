---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithPSNAsync"
description: "Signs the user in using a PlayStation :tm: Network authentication code, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithPSNAsync  

Signs the user in using a PlayStation :tm: Network authentication code, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithPSNAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const char* secretKey,  
    const PFAuthenticationServerLoginWithPSNRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`secretKey`** &nbsp; char*  
*_In_z_*  
  
Title Secret Key used to authenticate the service request.  
  
**`request`** &nbsp; [PFAuthenticationServerLoginWithPSNRequest*](../../pfauthenticationtypes/structs/pfauthenticationserverloginwithpsnrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. If this is the first time a user has signed in with the PlayStation :tm: Network account and CreateAccount is set to true, a new PlayFab account will be created and linked to the PlayStation :tm: Network account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the PlayStation :tm: Network account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. See also ServerLinkPSNAccountAsync, ServerUnlinkPSNAccountAsync. When the asynchronous task is complete, call [PFAuthenticationServerLoginWithPSNGetResult](pfauthenticationserverloginwithpsngetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
