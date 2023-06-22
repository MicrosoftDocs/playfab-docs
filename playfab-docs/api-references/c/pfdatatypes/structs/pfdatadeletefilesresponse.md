---
author: jasonsandlin
title: "PFDataDeleteFilesResponse"
description: "PFDataDeleteFilesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFDataDeleteFilesResponse  

PFDataDeleteFilesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataDeleteFilesResponse {  
    PFEntityKey const* entity;  
    int32_t profileVersion;  
} PFDataDeleteFilesResponse;  
```
  
### Members  
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`profileVersion`** &nbsp; int32_t  
  
The current version of the profile, can be used for concurrency control during updates.
  
  
## Requirements  
  
**Header:** PFDataTypes.h
  
## See also  
[PFDataTypes members](../pfdatatypes_members.md)  

  
  
