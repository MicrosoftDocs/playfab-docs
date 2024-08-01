---
author: jasonsandlin
title: "PFAuthenticationLoginWithGoogleAccountAsync"
description: "Signs the user in using their Google account credentials"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithGoogleAccountAsync  

Signs the user in using their Google account credentials  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithGoogleAccountAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithGoogleAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithGoogleAccountRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithgoogleaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Android. Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google sign-in for Android APIs on the device and passing it to this API. If this is the first time a user has signed in with the Google account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Google account. Otherwise, if no PlayFab account is linked to the Google account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. The current (recommended) method for obtaining a Google account credential in an Android application is to call GoogleSignInAccount.getServerAuthCode() and send the auth code as the ServerAuthCode parameter of this API. Before doing this, you must create an OAuth 2.0 web application client ID in the Google API Console and configure its client ID and secret in the PlayFab Game Manager Google Add-on for your title. This method does not require prompting of the user for additional Google account permissions, resulting in a user experience with the least possible friction. For more information about obtaining the server auth code, see https://developers.google.com/identity/sign-in/android/offline-access. The previous (deprecated) method was to obtain an OAuth access token by calling GetAccessToken() on the client and passing it as the AccessToken parameter to this API. for the with the Google OAuth 2.0 Access Token. More information on this change can be found in the Google developer documentation (https://android-developers.googleblog.com/2016/01/play-games-permissions-are-changing-in.html). When the asynchronous task is complete, call [PFAuthenticationLoginWithGoogleAccountGetResult](pfauthenticationloginwithgoogleaccountgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
