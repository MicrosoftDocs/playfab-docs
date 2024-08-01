---
author: jasonsandlin
title: "PFAuthenticationLoginWithGooglePlayGamesServicesRequest"
description: "PFAuthenticationLoginWithGooglePlayGamesServicesRequest data model. Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google Play Games sign-in for Android APIs on the device and passing it to this API. If this is the first time a user has signed in with the Google Play Games account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Google Play Games account. Otherwise, if no PlayFab account is linked to the Google Play Games account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. The current (recommended) method for obtaining a Google Play Games account credential in an Android application is to call GamesSignInClient.requestServerSideAccess() and send the auth code as the ServerAuthCode parameter of this API. Before doing this, you must create an OAuth 2.0 web application client ID in the Google API Console and configure its client ID and secret in the PlayFab Game Manager Google Add-on for your title. This method does not require prompting of the user for additional Google account permissions, resulting in a user experience with the least possible friction. For more information about obtaining the server auth code, see https://developers.google.com/games/services/android/signin."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithGooglePlayGamesServicesRequest  

PFAuthenticationLoginWithGooglePlayGamesServicesRequest data model. Google Play Games sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google Play Games sign-in for Android APIs on the device and passing it to this API. If this is the first time a user has signed in with the Google Play Games account and CreateAccount is set to true, a new PlayFab account will be created and linked to the Google Play Games account. Otherwise, if no PlayFab account is linked to the Google Play Games account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. The current (recommended) method for obtaining a Google Play Games account credential in an Android application is to call GamesSignInClient.requestServerSideAccess() and send the auth code as the ServerAuthCode parameter of this API. Before doing this, you must create an OAuth 2.0 web application client ID in the Google API Console and configure its client ID and secret in the PlayFab Game Manager Google Add-on for your title. This method does not require prompting of the user for additional Google account permissions, resulting in a user experience with the least possible friction. For more information about obtaining the server auth code, see https://developers.google.com/games/services/android/signin.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithGooglePlayGamesServicesRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
    const char* serverAuthCode;  
} PFAuthenticationLoginWithGooglePlayGamesServicesRequest;  
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
  
OAuth 2.0 server authentication code obtained on the client by calling the requestServerSideAccess() (https://developers.google.com/games/services/android/signin) Google Play Games client API.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
