---
author: jasonsandlin
title: "PFAuthenticationLoginWithAppleRequest"
description: "PFAuthenticationLoginWithAppleRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithAppleRequest  

PFAuthenticationLoginWithAppleRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithAppleRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* identityToken;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
} PFAuthenticationLoginWithAppleRequest;  
```
  
### Members  
  
**`createAccount`** &nbsp; bool  
  
Automatically create a PlayFab account if one is not currently linked to this ID.
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`identityToken`** &nbsp; const char*  
*is null-terminated*  
  
The JSON Web token (JWT) returned by Apple after login. Represented as the identityToken field in the authorization credential payload. If you choose to ignore the expiration date for identity tokens, you will receive an NotAuthorized error if Apple rotates the signing key. In this case, users have to login to provide a fresh identity token.
  
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

  
  
