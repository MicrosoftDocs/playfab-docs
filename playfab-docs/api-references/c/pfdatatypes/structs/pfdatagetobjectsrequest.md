---
author: jasonsandlin
title: "PFDataGetObjectsRequest"
description: "PFDataGetObjectsRequest data model. Gets JSON objects from an entity profile and returns it. ."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataGetObjectsRequest  

PFDataGetObjectsRequest data model. Gets JSON objects from an entity profile and returns it. .  

## Syntax  
  
```cpp
typedef struct PFDataGetObjectsRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    bool const* escapeObject;  
} PFDataGetObjectsRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`escapeObject`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Determines whether the object will be returned as an escaped JSON string or as a un-escaped JSON object. Default is JSON object.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
