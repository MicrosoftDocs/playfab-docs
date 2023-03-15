---
author: jasonsandlin
title: "PFDataGetObjectsResponse"
description: "PFDataGetObjectsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataGetObjectsResponse  

PFDataGetObjectsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataGetObjectsResponse {  
    PFEntityKey const* entity;  
    uint32_t objectsCount;  
    int32_t profileVersion;  
} PFDataGetObjectsResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`objectsCount`** &nbsp; uint32_t  
*array of size `objectsCount`*  
  
(Optional) Requested objects that the calling entity has access to.
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
