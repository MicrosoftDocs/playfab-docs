---
author: jasonsandlin
title: "PFAuthenticationLoginWithPSNRequest"
description: "PFAuthenticationLoginWithPSNRequest data model. If this is the first time a user has signed in with the PlayStation :tm: Network account and CreateAccount is set to true, a new PlayFab account will be created and linked to the PlayStation :tm: Network account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the PlayStation :tm: Network account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithPSNRequest  

PFAuthenticationLoginWithPSNRequest data model. If this is the first time a user has signed in with the PlayStation :tm: Network account and CreateAccount is set to true, a new PlayFab account will be created and linked to the PlayStation :tm: Network account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the PlayStation :tm: Network account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithPSNRequest {  
    const char* authCode;  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    int32_t const* issuerId;  
    const char* playerSecret;  
    const char* redirectUri;  
} PFAuthenticationLoginWithPSNRequest;  
```
  
### Members  
  
**`authCode`** &nbsp; const char*  
*is null-terminated*  
  
Auth code provided by the PlayStation :tm: Network OAuth provider.
  
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
  
**`issuerId`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
  
**`playerSecret`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player secret that is used to verify API request signatures (Enterprise Only).
  
**`redirectUri`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Redirect URI supplied to PlayStation :tm: Network when requesting an auth code.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
