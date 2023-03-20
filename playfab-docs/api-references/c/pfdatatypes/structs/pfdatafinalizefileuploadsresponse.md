---
author: jasonsandlin
title: "PFDataFinalizeFileUploadsResponse"
description: "PFDataFinalizeFileUploadsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataFinalizeFileUploadsResponse  

PFDataFinalizeFileUploadsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataFinalizeFileUploadsResponse {  
    PFEntityKey const* entity;  
    uint32_t metadataCount;  
    int32_t profileVersion;  
} PFDataFinalizeFileUploadsResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`metadataCount`** &nbsp; uint32_t  
*array of size `metadataCount`*  
  
(Optional) Collection of metadata for the entity's files.
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
