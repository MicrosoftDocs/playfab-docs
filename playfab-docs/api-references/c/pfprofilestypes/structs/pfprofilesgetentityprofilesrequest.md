---
author: jasonsandlin
title: "PFProfilesGetEntityProfilesRequest"
description: "PFProfilesGetEntityProfilesRequest data model. Given a set of entity types and entity identifiers will retrieve all readable profiles properties for the caller. Profiles that the caller is not allowed to read will silently not be included in the results."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesGetEntityProfilesRequest  

PFProfilesGetEntityProfilesRequest data model. Given a set of entity types and entity identifiers will retrieve all readable profiles properties for the caller. Profiles that the caller is not allowed to read will silently not be included in the results.  

## Syntax  
  
```cpp
typedef struct PFProfilesGetEntityProfilesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* dataAsObject;  
    PFEntityKey const* entities;  
    uint32_t entitiesCount;  
} PFProfilesGetEntityProfilesRequest;  
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
  
**`entities`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
Entity keys of the profiles to load. Must be between 1 and 25.
  
**`entitiesCount`** &nbsp; uint32_t  
  
Count of entities
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
