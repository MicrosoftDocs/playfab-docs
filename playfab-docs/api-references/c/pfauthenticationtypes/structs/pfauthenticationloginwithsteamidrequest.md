---
author: jasonsandlin
title: "PFAuthenticationLoginWithSteamIdRequest"
description: "PFAuthenticationLoginWithSteamIdRequest data model. If this is the first time a user has signed in with the Steam ID and CreateAccount is set to true, a new PlayFab account will be created and linked to the Steam account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Steam users that are not logged into the Steam Client app will only have their Steam username synced, other data, such as currency and country will not be available until they login while the Client is open."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithSteamIdRequest  

PFAuthenticationLoginWithSteamIdRequest data model. If this is the first time a user has signed in with the Steam ID and CreateAccount is set to true, a new PlayFab account will be created and linked to the Steam account. In this case, no email or username will be associated with the PlayFab account. Otherwise, if no PlayFab account is linked to the Steam account, an error indicating this will be returned, so that the title can guide the user through creation of a PlayFab account. Steam users that are not logged into the Steam Client app will only have their Steam username synced, other data, such as currency and country will not be available until they login while the Client is open.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithSteamIdRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* steamId;  
} PFAuthenticationLoginWithSteamIdRequest;  
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
  
**`steamId`** &nbsp; const char*  
*is null-terminated*  
  
Unique Steam identifier for a user.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
