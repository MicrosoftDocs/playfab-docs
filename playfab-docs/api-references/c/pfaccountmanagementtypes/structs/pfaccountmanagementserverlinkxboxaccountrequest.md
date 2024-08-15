---
author: jasonsandlin
title: "PFAccountManagementServerLinkXboxAccountRequest"
description: "PFAccountManagementServerLinkXboxAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerLinkXboxAccountRequest  

PFAccountManagementServerLinkXboxAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerLinkXboxAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* playFabId;  
    const char* xboxToken;  
} PFAccountManagementServerLinkXboxAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Xbox Live identifier.
  
**`xboxToken`** &nbsp; const char*  
*is null-terminated*  
  
Token provided by the Xbox Live SDK/XDK method GetTokenAndSignatureAsync("POST", "https://playfabapi.com/", "").
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
