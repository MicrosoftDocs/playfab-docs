---
author: jasonsandlin
title: "PFAccountManagementLinkGameCenterAccountRequest"
description: "PFAccountManagementLinkGameCenterAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkGameCenterAccountRequest  

PFAccountManagementLinkGameCenterAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkGameCenterAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* gameCenterId;  
    const char* publicKeyUrl;  
    const char* salt;  
    const char* signature;  
    const char* timestamp;  
} PFAccountManagementLinkGameCenterAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link. If the current user is already linked, link both accounts.
  
**`gameCenterId`** &nbsp; const char*  
*is null-terminated*  
  
Game Center identifier for the player account to be linked.
  
**`publicKeyUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The URL for the public encryption key that will be used to verify the signature.
  
**`salt`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) A random value used to compute the hash and keep it randomized.
  
**`signature`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The verification signature of the authentication payload.
  
**`timestamp`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The integer representation of date and time that the signature was created on. PlayFab will reject authentication signatures not within 10 minutes of the server's current time.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
