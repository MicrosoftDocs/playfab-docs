---
author: jasonsandlin
title: "PFAuthenticationLoginWithGameCenterAsync"
description: "Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Logging in with a Game Center ID is insecure if you do not include the optional PublicKeyUrl, Salt, Signature, and Timestamp parameters in this request. It is recommended you require these parameters on all Game Center calls by going to the Apple Add-ons page in the PlayFab Game Manager and enabling the 'Require secure authentication only for this app' option."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithGameCenterAsync  

Signs the user in using an iOS Game Center player identifier, returning a session identifier that can subsequently be used for API calls which require an authenticated user. Logging in with a Game Center ID is insecure if you do not include the optional PublicKeyUrl, Salt, Signature, and Timestamp parameters in this request. It is recommended you require these parameters on all Game Center calls by going to the Apple Add-ons page in the PlayFab Game Manager and enabling the 'Require secure authentication only for this app' option.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithGameCenterAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithGameCenterRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithGameCenterRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithgamecenterrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on iOS. The Game Center player identifier (https://developer.apple.com/library/ios/documentation/Accounts/Reference/ACAccountClassRef/index.html# // apple_ref/occ/instp/ACAccount/identifier) is a generated string which is stored on the local device. As with device identifiers, care must be taken to never expose a player's Game Center identifier to end users, as that could result in a user's account being compromised. If this is the first time a user has signed in with Game Center and CreateAccount is set to true, a new PlayFab account will be created and linked to the Game Center identifier. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Game Center account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. If an invalid iOS Game Center player identifier is used, an error indicating this will be returned. See also ClientLoginWithIOSDeviceIDAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithGameCenterGetResult](pfauthenticationloginwithgamecentergetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
