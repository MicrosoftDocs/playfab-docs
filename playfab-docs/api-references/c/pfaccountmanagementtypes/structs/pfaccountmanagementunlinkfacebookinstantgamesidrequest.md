---
author: jasonsandlin
title: "PFAccountManagementUnlinkFacebookInstantGamesIdRequest"
description: "PFAccountManagementUnlinkFacebookInstantGamesIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUnlinkFacebookInstantGamesIdRequest  

PFAccountManagementUnlinkFacebookInstantGamesIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUnlinkFacebookInstantGamesIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* facebookInstantGamesId;  
} PFAccountManagementUnlinkFacebookInstantGamesIdRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`facebookInstantGamesId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Facebook Instant Games identifier for the user. If not specified, the most recently signed in ID will be used.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
