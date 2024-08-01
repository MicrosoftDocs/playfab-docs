---
author: jasonsandlin
title: "PFAccountManagementLinkOpenIdConnectRequest"
description: "PFAccountManagementLinkOpenIdConnectRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkOpenIdConnectRequest  

PFAccountManagementLinkOpenIdConnectRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkOpenIdConnectRequest {  
    const char* connectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* idToken;  
} PFAccountManagementLinkOpenIdConnectRequest;  
```
  
### Members  
  
**`connectionId`** &nbsp; const char*  
*is null-terminated*  
  
A name that identifies which configured OpenID Connect provider relationship to use. Maximum 100 characters.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to a specific OpenId Connect user, unlink the other user and re-link.
  
**`idToken`** &nbsp; const char*  
*is null-terminated*  
  
The JSON Web token (JWT) returned by the identity provider after login. Represented as the id_token field in the identity provider's response. Used to validate the request and find the user ID (OpenID Connect subject) to link with.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
