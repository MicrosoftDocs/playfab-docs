---
author: jasonsandlin
title: "PFAuthenticationLoginWithGameCenterRequest"
description: "PFAuthenticationLoginWithGameCenterRequest data model. The Game Center player identifier (https://developer.apple.com/library/ios/documentation/Accounts/Reference/ACAccountClassRef/index.html# // apple_ref/occ/instp/ACAccount/identifier) is a generated string which is stored on the local device. As with device identifiers, care must be taken to never expose a player's Game Center identifier to end users, as that could result in a user's account being compromised. If this is the first time a user has signed in with Game Center and CreateAccount is set to true, a new PlayFab account will be created and linked to the Game Center identifier. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Game Center account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. If an invalid iOS Game Center player identifier is used, an error indicating this will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithGameCenterRequest  

PFAuthenticationLoginWithGameCenterRequest data model. The Game Center player identifier (https://developer.apple.com/library/ios/documentation/Accounts/Reference/ACAccountClassRef/index.html# // apple_ref/occ/instp/ACAccount/identifier) is a generated string which is stored on the local device. As with device identifiers, care must be taken to never expose a player's Game Center identifier to end users, as that could result in a user's account being compromised. If this is the first time a user has signed in with Game Center and CreateAccount is set to true, a new PlayFab account will be created and linked to the Game Center identifier. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Game Center account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. If an invalid iOS Game Center player identifier is used, an error indicating this will be returned.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithGameCenterRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerId;  
    const char* playerSecret;  
    const char* publicKeyUrl;  
    const char* salt;  
    const char* signature;  
    const char* timestamp;  
} PFAuthenticationLoginWithGameCenterRequest;  
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
  
**`playerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Game Center player id.
  
**`playerSecret`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player secret that is used to verify API request signatures (Enterprise Only).
  
**`publicKeyUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The URL for the public encryption key that will be used to verify the signature.
  
**`salt`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) A random value used to compute the hash and keep it randomized.
  
**`signature`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The verification signature of the authentication payload.
  
**`timestamp`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The integer representation of date and time that the signature was created on. PlayFab will reject authentication signatures not within 10 minutes of the server's current time.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
