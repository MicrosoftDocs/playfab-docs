---
author: jasonsandlin
title: "PFAuthenticationLoginWithGoogleAccountRequest"
description: "PFAuthenticationLoginWithGoogleAccountRequest data model. Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google sign-in for Android APIs on the device and passing it to this API. If this is the first time a user has signed in with the Google account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Google account. Otherwise, if no PlayFab account is linked to the Google account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. The current (recommended) method for obtaining a Google account credential in an Android application is to call GoogleSignInAccount.getServerAuthCode() and send the auth code as the ServerAuthCode parameter of this API. Before doing this, you must create an OAuth 2.0 web application client ID in the Google API Console and configure its client ID and secret in the PlayFab Game Manager Google Add-on for your title. This method does not require prompting of the user for additional Google account permissions, resulting in a user experience with the least possible friction. For more information about obtaining the server auth code, see https://developers.google.com/identity/sign-in/android/offline-access. The previous (deprecated) method was to obtain an OAuth access token by calling GetAccessToken() on the client and passing it as the AccessToken parameter to this API. for the with the Google OAuth 2.0 Access Token. More information on this change can be found in the Google developer documentation (https://android-developers.googleblog.com/2016/01/play-games-permissions-are-changing-in.html)."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithGoogleAccountRequest  

PFAuthenticationLoginWithGoogleAccountRequest data model. Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google sign-in for Android APIs on the device and passing it to this API. If this is the first time a user has signed in with the Google account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Google account. Otherwise, if no PlayFab account is linked to the Google account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. The current (recommended) method for obtaining a Google account credential in an Android application is to call GoogleSignInAccount.getServerAuthCode() and send the auth code as the ServerAuthCode parameter of this API. Before doing this, you must create an OAuth 2.0 web application client ID in the Google API Console and configure its client ID and secret in the PlayFab Game Manager Google Add-on for your title. This method does not require prompting of the user for additional Google account permissions, resulting in a user experience with the least possible friction. For more information about obtaining the server auth code, see https://developers.google.com/identity/sign-in/android/offline-access. The previous (deprecated) method was to obtain an OAuth access token by calling GetAccessToken() on the client and passing it as the AccessToken parameter to this API. for the with the Google OAuth 2.0 Access Token. More information on this change can be found in the Google developer documentation (https://android-developers.googleblog.com/2016/01/play-games-permissions-are-changing-in.html).  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithGoogleAccountRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
    const char* serverAuthCode;  
    bool const* setEmail;  
} PFAuthenticationLoginWithGoogleAccountRequest;  
```
  
### Members  
  
**`createAccount`** &nbsp; bool  
  
Automatically create a PlayFab account if one is not currently linked to this ID.
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`infoRequestParameters`** &nbsp; PFGetPlayerCombinedInfoRequestParams const*  
*may be nullptr*  
  
(Optional) Flags for which pieces of info to return for the user.
  
**`playerSecret`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player secret that is used to verify API request signatures (Enterprise Only).
  
**`serverAuthCode`** &nbsp; const char*  
*is null-terminated*  
  
OAuth 2.0 server authentication code obtained on the client by calling the getServerAuthCode() (https://developers.google.com/identity/sign-in/android/offline-access) Google client API.
  
**`setEmail`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Optional boolean to opt out of setting the MPA email when creating a Google account, defaults to true.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
