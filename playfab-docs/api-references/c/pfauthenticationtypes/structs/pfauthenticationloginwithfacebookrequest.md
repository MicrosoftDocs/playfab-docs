---
author: jasonsandlin
title: "PFAuthenticationLoginWithFacebookRequest"
description: "PFAuthenticationLoginWithFacebookRequest data model. Facebook sign-in is accomplished using the Facebook User Access Token. More information on the Token can be found in the Facebook developer documentation (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject FB. If this is the first time a user has signed in with the Facebook account and CreateAccount is set to true, a new PlayFab account will be created and linked to the provided account's Facebook ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Facebook account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Note that titles should never re-use the same Facebook applications between PlayFab Title IDs, as Facebook provides unique user IDs per application and doing so can result in issues with the Facebook ID for the user in their PlayFab account information. If you must re-use an application in a new PlayFab Title ID, please be sure to first unlink all accounts from Facebook, or delete all users in the first Title ID."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithFacebookRequest  

PFAuthenticationLoginWithFacebookRequest data model. Facebook sign-in is accomplished using the Facebook User Access Token. More information on the Token can be found in the Facebook developer documentation (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject FB. If this is the first time a user has signed in with the Facebook account and CreateAccount is set to true, a new PlayFab account will be created and linked to the provided account's Facebook ID. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Facebook account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Note that titles should never re-use the same Facebook applications between PlayFab Title IDs, as Facebook provides unique user IDs per application and doing so can result in issues with the Facebook ID for the user in their PlayFab account information. If you must re-use an application in a new PlayFab Title ID, please be sure to first unlink all accounts from Facebook, or delete all users in the first Title ID.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithFacebookRequest {  
    const char* accessToken;  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
} PFAuthenticationLoginWithFacebookRequest;  
```
  
### Members  
  
**`accessToken`** &nbsp; const char*  
*is null-terminated*  
  
Unique identifier from Facebook for the user.
  
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
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
