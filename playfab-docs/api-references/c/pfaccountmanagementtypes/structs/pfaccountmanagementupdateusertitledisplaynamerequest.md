---
author: jasonsandlin
title: "PFAccountManagementUpdateUserTitleDisplayNameRequest"
description: "PFAccountManagementUpdateUserTitleDisplayNameRequest data model. In addition to the PlayFab username, titles can make use of a DisplayName which is also a unique identifier, but specific to the title. This allows for unique names which more closely match the theme or genre of a title, for example."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUpdateUserTitleDisplayNameRequest  

PFAccountManagementUpdateUserTitleDisplayNameRequest data model. In addition to the PlayFab username, titles can make use of a DisplayName which is also a unique identifier, but specific to the title. This allows for unique names which more closely match the theme or genre of a title, for example.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUpdateUserTitleDisplayNameRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* displayName;  
} PFAccountManagementUpdateUserTitleDisplayNameRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
New title display name for the user - must be between 3 and 25 characters.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
