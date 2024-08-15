---
author: jasonsandlin
title: "PFEntityKey C API"
description: "PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityKey C API 

PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity.  

## Syntax  
  
```cpp
typedef struct PFEntityKey {  
    const char* id;  
    const char* type;  
} PFEntityKey;  
```
  
### Members  
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
Unique ID of the entity.
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
