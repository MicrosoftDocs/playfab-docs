---
author: jasonsandlin
title: "PFAccountManagementLinkAppleRequest"
description: "PFAccountManagementLinkAppleRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkAppleRequest  

PFAccountManagementLinkAppleRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkAppleRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* identityToken;  
} PFAccountManagementLinkAppleRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to a specific Apple account, unlink the other user and re-link.
  
**`identityToken`** &nbsp; const char*  
*is null-terminated*  
  
The JSON Web token (JWT) returned by Apple after login. Represented as the identityToken field in the authorization credential payload. Used to validate the request and find the user ID (Apple subject) to link with.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
