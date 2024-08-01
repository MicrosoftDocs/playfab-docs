---
author: jasonsandlin
title: "PFAccountManagementAddUsernamePasswordRequest"
description: "PFAccountManagementAddUsernamePasswordRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementAddUsernamePasswordRequest  

PFAccountManagementAddUsernamePasswordRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementAddUsernamePasswordRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* email;  
    const char* password;  
    const char* username;  
} PFAccountManagementAddUsernamePasswordRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`email`** &nbsp; const char*  
*is null-terminated*  
  
User email address attached to their account.
  
**`password`** &nbsp; const char*  
*is null-terminated*  
  
Password for the PlayFab account (6-100 characters).
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
PlayFab username for the account (3-20 characters).
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
