---
author: jasonsandlin
title: "PFAccountManagementSetDisplayNameRequest"
description: "PFAccountManagementSetDisplayNameRequest data model. Given an entity profile, will update its display name to the one passed in if the profile's version is equal to the specified value."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementSetDisplayNameRequest  

PFAccountManagementSetDisplayNameRequest data model. Given an entity profile, will update its display name to the one passed in if the profile's version is equal to the specified value.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSetDisplayNameRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* displayName;  
    PFEntityKey const* entity;  
    int32_t const* expectedVersion;  
} PFAccountManagementSetDisplayNameRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The new value to be set on Entity Profile's display name.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`expectedVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The expected version of a profile to perform this update on.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
