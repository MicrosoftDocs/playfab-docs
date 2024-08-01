---
author: jasonsandlin
title: "PFAuthenticationLoginWithOpenIdConnectRequest"
description: "PFAuthenticationLoginWithOpenIdConnectRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithOpenIdConnectRequest  

PFAuthenticationLoginWithOpenIdConnectRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithOpenIdConnectRequest {  
    const char* connectionId;  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* idToken;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
} PFAuthenticationLoginWithOpenIdConnectRequest;  
```
  
### Members  
  
**`connectionId`** &nbsp; const char*  
*is null-terminated*  
  
A name that identifies which configured OpenID Connect provider relationship to use. Maximum 100 characters.
  
**`createAccount`** &nbsp; bool  
  
Automatically create a PlayFab account if one is not currently linked to this ID.
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`idToken`** &nbsp; const char*  
*is null-terminated*  
  
The JSON Web token (JWT) returned by the identity provider after login. Represented as the id_token field in the identity provider's response.
  
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

  
  
