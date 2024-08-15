---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkXboxAccountRequest"
description: "PFAccountManagementServerUnlinkXboxAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerUnlinkXboxAccountRequest  

PFAccountManagementServerUnlinkXboxAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerUnlinkXboxAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
} PFAccountManagementServerUnlinkXboxAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Xbox Live identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
