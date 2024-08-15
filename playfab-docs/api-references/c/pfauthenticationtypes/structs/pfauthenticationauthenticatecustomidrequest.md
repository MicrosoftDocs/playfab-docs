---
author: jasonsandlin
title: "PFAuthenticationAuthenticateCustomIdRequest"
description: "PFAuthenticationAuthenticateCustomIdRequest data model. Create or return a game_server entity token. Caller must be a title entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationAuthenticateCustomIdRequest  

PFAuthenticationAuthenticateCustomIdRequest data model. Create or return a game_server entity token. Caller must be a title entity.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationAuthenticateCustomIdRequest {  
    const char* customId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAuthenticationAuthenticateCustomIdRequest;  
```
  
### Members  
  
**`customId`** &nbsp; const char*  
*is null-terminated*  
  
The customId used to create and retrieve game_server entity tokens. This is unique at the title level. CustomId must be between 32 and 100 characters.
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
