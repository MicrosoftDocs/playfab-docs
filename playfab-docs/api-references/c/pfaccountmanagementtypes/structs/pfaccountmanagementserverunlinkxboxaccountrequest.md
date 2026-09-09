---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkXboxAccountRequest"
description: "PFAccountManagementServerUnlinkXboxAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
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
  
PlayFab unique identifier of the user to unlink.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
