---
author: jasonsandlin
title: "PFAuthenticationValidateEntityTokenRequest"
description: "PFAuthenticationValidateEntityTokenRequest data model. Given an entity token, validates that it hasn't expired or been revoked and will return details of the owner."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationValidateEntityTokenRequest  

PFAuthenticationValidateEntityTokenRequest data model. Given an entity token, validates that it hasn't expired or been revoked and will return details of the owner.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationValidateEntityTokenRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* entityToken;  
} PFAuthenticationValidateEntityTokenRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entityToken`** &nbsp; const char*  
*is null-terminated*  
  
Client EntityToken.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
