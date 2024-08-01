---
author: jasonsandlin
title: "PFAuthenticationLoginWithXboxAsync"
description: "Signs the user in using a Xbox Live Token, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithXboxAsync  

Signs the user in using a Xbox Live Token, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithXboxAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithXboxRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithXboxRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithxboxrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. If this is the first time a user has signed in with the Xbox Live account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Xbox Live account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Xbox Live account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. See also ClientLinkXboxAccountAsync, ClientUnlinkXboxAccountAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithXboxGetResult](pfauthenticationloginwithxboxgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
