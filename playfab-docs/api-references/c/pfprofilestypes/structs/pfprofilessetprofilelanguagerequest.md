---
author: jasonsandlin
title: "PFProfilesSetProfileLanguageRequest"
description: "PFProfilesSetProfileLanguageRequest data model. Given an entity profile, will update its language to the one passed in if the profile's version is equal to the one passed in."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFProfilesSetProfileLanguageRequest  

PFProfilesSetProfileLanguageRequest data model. Given an entity profile, will update its language to the one passed in if the profile's version is equal to the one passed in.  

## Syntax  
  
```cpp
typedef struct PFProfilesSetProfileLanguageRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    int32_t const* expectedVersion;  
    const char* language;  
} PFProfilesSetProfileLanguageRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`expectedVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The expected version of a profile to perform this update on.
  
**`language`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The language to set on the given entity. Deletes the profile's language if passed in a null string.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
