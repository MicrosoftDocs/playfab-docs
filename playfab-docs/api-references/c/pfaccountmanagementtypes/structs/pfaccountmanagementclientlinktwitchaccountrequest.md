---
author: jasonsandlin
title: "PFAccountManagementClientLinkTwitchAccountRequest"
description: "PFAccountManagementClientLinkTwitchAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientLinkTwitchAccountRequest  

PFAccountManagementClientLinkTwitchAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientLinkTwitchAccountRequest {  
    const char* accessToken;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
} PFAccountManagementClientLinkTwitchAccountRequest;  
```
  
### Members  
  
**`accessToken`** &nbsp; const char*  
*is null-terminated*  
  
Valid token issued by Twitch.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
