---
author: jasonsandlin
title: "PFAccountManagementServerLinkNintendoServiceAccountRequest"
description: "PFAccountManagementServerLinkNintendoServiceAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerLinkNintendoServiceAccountRequest  

PFAccountManagementServerLinkNintendoServiceAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerLinkNintendoServiceAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* identityToken;  
    const char* playFabId;  
} PFAccountManagementServerLinkNintendoServiceAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to a specific Nintendo Switch account, unlink the other user and re-link.
  
**`identityToken`** &nbsp; const char*  
*is null-terminated*  
  
The JSON Web token (JWT) returned by Nintendo after login. Used to validate the request and find the user ID (Nintendo Switch subject) to link with.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
