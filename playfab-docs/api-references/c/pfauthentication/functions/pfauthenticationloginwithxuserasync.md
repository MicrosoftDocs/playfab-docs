---
author: jasonsandlin
title: "PFAuthenticationLoginWithXUserAsync"
description: "Signs the user in using an XUserHandle, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithXUserAsync  

Signs the user in using an XUserHandle, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithXUserAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithXUserRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithXUserRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithxuserrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on GDK. If this is the first time a user has signed in with the Xbox Live account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. See also ClientLinkXboxAccountAsync, ClientUnlinkXboxAccountAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithXUserGetResult](pfauthenticationloginwithxusergetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
