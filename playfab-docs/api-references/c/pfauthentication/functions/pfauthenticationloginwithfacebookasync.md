---
author: jasonsandlin
title: "PFAuthenticationLoginWithFacebookAsync"
description: "Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API calls which require an authenticated user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithFacebookAsync  

Signs the user in using a Facebook access token, returning a session identifier that can subsequently be used for API calls which require an authenticated user  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithFacebookAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithFacebookRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithFacebookRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithfacebookrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Android and iOS. Facebook sign-in is accomplished using the Facebook User Access Token. More information on the Token can be found in the Facebook developer documentation (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject FB. If this is the first time a user has signed in with the Facebook account and CreateAccount is set to true, a new PlayFab account will be created and linked to the provided account's Facebook ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Facebook account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Note that titles should never re-use the same Facebook applications between PlayFab Title IDs, as Facebook provides unique user IDs per application and doing so can result in issues with the Facebook ID for the user in their PlayFab account information. If you must re-use an application in a new PlayFab Title ID, please be sure to first unlink all accounts from Facebook, or delete all users in the first Title ID. See also ClientLinkFacebookAccountAsync, ClientUnlinkFacebookAccountAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithFacebookGetResult](pfauthenticationloginwithfacebookgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
