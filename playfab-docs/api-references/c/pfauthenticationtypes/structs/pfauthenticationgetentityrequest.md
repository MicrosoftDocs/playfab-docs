---
author: jasonsandlin
title: "PFAuthenticationGetEntityRequest"
description: "PFAuthenticationGetEntityRequest data model. This API must be called with X-SecretKey, X-Authentication or X-EntityToken headers. The header must still be valid and cannot be expired or revoked.If successful, it will issue a new entity token and emit the \"entity_logged_in\" PlayStream event."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationGetEntityRequest  

PFAuthenticationGetEntityRequest data model. This API must be called with X-SecretKey, X-Authentication or X-EntityToken headers. The header must still be valid and cannot be expired or revoked.If successful, it will issue a new entity token and emit the "entity_logged_in" PlayStream event.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationGetEntityRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAuthenticationGetEntityRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; PFStringDictionaryEntry const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
