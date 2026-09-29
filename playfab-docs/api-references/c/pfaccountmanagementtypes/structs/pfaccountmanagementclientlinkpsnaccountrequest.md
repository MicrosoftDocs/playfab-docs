---
author: jasonsandlin
title: "PFAccountManagementClientLinkPSNAccountRequest"
description: "PFAccountManagementClientLinkPSNAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientLinkPSNAccountRequest  

PFAccountManagementClientLinkPSNAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientLinkPSNAccountRequest {  
    const char* authCode;  
    const char* authVersion;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    int32_t const* issuerId;  
    const char* redirectUri;  
} PFAccountManagementClientLinkPSNAccountRequest;  
```
  
### Members  
  
**`authCode`** &nbsp; const char*  
*is null-terminated*  
  
Authentication code provided by the PlayStation :tm: Network.
  
**`authVersion`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional PlayStation :tm: Network auth version. Controls which PlayStation :tm: Network auth version is used. Accepted values are "v2" and "v3".
  
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
  
**`redirectUri`** &nbsp; const char*  
*is null-terminated*  
  
Redirect URI supplied to PlayStation :tm: Network when requesting an auth code.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
