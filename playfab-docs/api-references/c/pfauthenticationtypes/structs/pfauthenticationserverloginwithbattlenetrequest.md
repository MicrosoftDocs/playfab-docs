---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithBattleNetRequest"
description: "PFAuthenticationServerLoginWithBattleNetRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithBattleNetRequest  

PFAuthenticationServerLoginWithBattleNetRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationServerLoginWithBattleNetRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* identityToken;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
} PFAuthenticationServerLoginWithBattleNetRequest;  
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
  
The JSON Web Token (JWT) returned by Battle.net after login.
  
**`infoRequestParameters`** &nbsp; PFGetPlayerCombinedInfoRequestParams const*  
*may be nullptr*  
  
(Optional) Flags for which pieces of info to return for the user.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
