---
author: jasonsandlin
title: "PFDataAbortFileUploadsResponse"
description: "PFDataAbortFileUploadsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataAbortFileUploadsResponse  

PFDataAbortFileUploadsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFDataAbortFileUploadsResponse {  
    PFEntityKey const* entity;  
    int32_t profileVersion;  
} PFDataAbortFileUploadsResponse;  
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

  
  
