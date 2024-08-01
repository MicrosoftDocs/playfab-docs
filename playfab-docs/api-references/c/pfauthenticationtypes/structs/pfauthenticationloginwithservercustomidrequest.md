---
author: jasonsandlin
title: "PFAuthenticationLoginWithServerCustomIdRequest"
description: "PFAuthenticationLoginWithServerCustomIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithServerCustomIdRequest  

PFAuthenticationLoginWithServerCustomIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginWithServerCustomIdRequest {  
    bool createAccount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFGetPlayerCombinedInfoRequestParams const* infoRequestParameters;  
    const char* playerSecret;  
    const char* serverCustomId;  
} PFAuthenticationLoginWithServerCustomIdRequest;  
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
  
**`serverCustomId`** &nbsp; const char*  
*is null-terminated*  
  
The backend server identifier for this player.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
