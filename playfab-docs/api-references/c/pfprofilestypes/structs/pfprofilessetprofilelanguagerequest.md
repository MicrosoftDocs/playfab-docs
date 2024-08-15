---
author: jasonsandlin
title: "PFProfilesSetProfileLanguageRequest"
description: "PFProfilesSetProfileLanguageRequest data model. Given an entity profile, will update its language to the one passed in if the profile's version is equal to the one passed in."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesSetProfileLanguageRequest  

PFProfilesSetProfileLanguageRequest data model. Given an entity profile, will update its language to the one passed in if the profile's version is equal to the one passed in.  

## Syntax  
  
```cpp
typedef struct PFProfilesSetProfileLanguageRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    int32_t const* expectedVersion;  
    const char* language;  
} PFProfilesSetProfileLanguageRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
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

  
  
