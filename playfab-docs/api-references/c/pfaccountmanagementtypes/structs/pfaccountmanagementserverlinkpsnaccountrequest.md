---
author: jasonsandlin
title: "PFAccountManagementServerLinkPSNAccountRequest"
description: "PFAccountManagementServerLinkPSNAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerLinkPSNAccountRequest  

PFAccountManagementServerLinkPSNAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerLinkPSNAccountRequest {  
    const char* authCode;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    int32_t const* issuerId;  
    const char* playFabId;  
    const char* redirectUri;  
} PFAccountManagementServerLinkPSNAccountRequest;  
```
  
### Members  
  
**`authCode`** &nbsp; const char*  
*is null-terminated*  
  
Authentication code provided by the PlayStation :tm: Network.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link.
  
**`issuerId`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`redirectUri`** &nbsp; const char*  
*is null-terminated*  
  
Redirect URI supplied to PlayStation :tm: Network when requesting an auth code.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
