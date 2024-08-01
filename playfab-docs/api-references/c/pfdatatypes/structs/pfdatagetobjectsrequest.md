---
author: jasonsandlin
title: "PFDataGetObjectsRequest"
description: "PFDataGetObjectsRequest data model. Gets JSON objects from an entity profile and returns it. ."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataGetObjectsRequest  

PFDataGetObjectsRequest data model. Gets JSON objects from an entity profile and returns it. .  

## Syntax  
  
```cpp
typedef struct PFDataGetObjectsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    bool const* escapeObject;  
} PFDataGetObjectsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`escapeObject`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Determines whether the object will be returned as an escaped JSON string or as a un-escaped JSON object. Default is JSON object.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
