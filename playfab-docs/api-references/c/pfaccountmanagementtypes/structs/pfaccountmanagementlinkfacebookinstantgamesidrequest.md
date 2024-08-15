---
author: jasonsandlin
title: "PFAccountManagementLinkFacebookInstantGamesIdRequest"
description: "PFAccountManagementLinkFacebookInstantGamesIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkFacebookInstantGamesIdRequest  

PFAccountManagementLinkFacebookInstantGamesIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkFacebookInstantGamesIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* facebookInstantGamesSignature;  
    bool const* forceLink;  
} PFAccountManagementLinkFacebookInstantGamesIdRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`facebookInstantGamesSignature`** &nbsp; const char*  
*is null-terminated*  
  
Facebook Instant Games signature for the user.
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the Facebook Instant Games ID, unlink the other user and re-link.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
