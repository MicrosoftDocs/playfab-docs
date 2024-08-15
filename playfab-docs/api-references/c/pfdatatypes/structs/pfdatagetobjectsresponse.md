---
author: jasonsandlin
title: "PFDataGetObjectsResponse"
description: "PFDataGetObjectsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataGetObjectsResponse  

PFDataGetObjectsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataGetObjectsResponse {  
    PFEntityKey const* entity;  
    PFDataObjectResultDictionaryEntry const* objects;  
    uint32_t objectsCount;  
    int32_t profileVersion;  
} PFDataGetObjectsResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`objects`** &nbsp; PFDataObjectResultDictionaryEntry const*  
*may be nullptr*  
  
(Optional) Requested objects that the calling entity has access to.
  
**`objectsCount`** &nbsp; uint32_t  
  
Count of objects
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
