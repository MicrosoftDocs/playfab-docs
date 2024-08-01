---
author: jasonsandlin
title: "PFProfilesGetEntityProfileRequest"
description: "PFProfilesGetEntityProfileRequest data model. Given an entity type and entity identifier will retrieve the profile from the entity store. If the profile being retrieved is the caller's, then the read operation is consistent, if not it is an inconsistent read. An inconsistent read means that we do not guarantee all committed writes have occurred before reading the profile, allowing for a stale read. If consistency is important the Version Number on the result can be used to compare which version of the profile any reader has."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetEntityProfileRequest  

PFProfilesGetEntityProfileRequest data model. Given an entity type and entity identifier will retrieve the profile from the entity store. If the profile being retrieved is the caller's, then the read operation is consistent, if not it is an inconsistent read. An inconsistent read means that we do not guarantee all committed writes have occurred before reading the profile, allowing for a stale read. If consistency is important the Version Number on the result can be used to compare which version of the profile any reader has.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetEntityProfileRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* dataAsObject;  
    PFEntityKey const* entity;  
} PFProfilesGetEntityProfileRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`dataAsObject`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Determines whether the objects will be returned as an escaped JSON string or as a un-escaped JSON object. Default is JSON string.
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
