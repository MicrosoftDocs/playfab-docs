---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkNintendoServiceAccountRequest"
description: "PFAccountManagementServerUnlinkNintendoServiceAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerUnlinkNintendoServiceAccountRequest  

PFAccountManagementServerUnlinkNintendoServiceAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerUnlinkNintendoServiceAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
} PFAccountManagementServerUnlinkNintendoServiceAccountRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
