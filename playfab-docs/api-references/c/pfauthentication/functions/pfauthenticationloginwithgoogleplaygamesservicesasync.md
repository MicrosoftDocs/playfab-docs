---
author: jasonsandlin
title: "PFAuthenticationLoginWithGooglePlayGamesServicesAsync"
description: "Signs the user in using their Google Play Games account credentials"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithGooglePlayGamesServicesAsync  

Signs the user in using their Google Play Games account credentials  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithGooglePlayGamesServicesAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithGooglePlayGamesServicesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithGooglePlayGamesServicesRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithgoogleplaygamesservicesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Android. Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google Play Games sign-in for Android APIs on the device and passing it to this API. If this is the first time a user has signed in with the Google Play Games account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Google Play Games account. Otherwise, if no PlayFab account is linked to the Google Play Games account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. The current (recommended) method for obtaining a Google Play Games account credential in an Android application is to call GamesSignInClient.requestServerSideAccess() and send the auth code as the ServerAuthCode parameter of this API. Before doing this, you must create an OAuth 2.0 web application client ID in the Google API Console and configure its client ID and secret in the PlayFab Game Manager Google Add-on for your title. This method does not require prompting of the user for additional Google account permissions, resulting in a user experience with the least possible friction. For more information about obtaining the server auth code, see https://developers.google.com/games/services/android/signin. When the asynchronous task is complete, call [PFAuthenticationLoginWithGooglePlayGamesServicesGetResult](pfauthenticationloginwithgoogleplaygamesservicesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
