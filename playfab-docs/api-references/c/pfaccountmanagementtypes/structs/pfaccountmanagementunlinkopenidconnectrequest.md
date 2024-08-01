---
author: jasonsandlin
title: "PFAccountManagementUnlinkOpenIdConnectRequest"
description: "PFAccountManagementUnlinkOpenIdConnectRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUnlinkOpenIdConnectRequest  

PFAccountManagementUnlinkOpenIdConnectRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUnlinkOpenIdConnectRequest {  
    const char* connectionId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementUnlinkOpenIdConnectRequest;  
```
  
### Members  
  
**`connectionId`** &nbsp; const char*  
*is null-terminated*  
  
A name that identifies which configured OpenID Connect provider relationship to use. Maximum 100 characters.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
