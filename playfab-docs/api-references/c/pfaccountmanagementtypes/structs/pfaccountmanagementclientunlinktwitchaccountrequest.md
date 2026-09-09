---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkTwitchAccountRequest"
description: "PFAccountManagementClientUnlinkTwitchAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientUnlinkTwitchAccountRequest  

PFAccountManagementClientUnlinkTwitchAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientUnlinkTwitchAccountRequest {  
    const char* accessToken;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementClientUnlinkTwitchAccountRequest;  
```
  
### Members  
  
**`accessToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Valid token issued by Twitch. Used to specify which twitch account to unlink from the profile. By default it uses the one that is present on the profile.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
