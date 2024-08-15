---
author: ScottMunroMS
title: "PFEntityKey - PlayFab Multiplayer SDK"
description: "PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# PFEntityKey  

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
*_Null_terminated_*  
  
Unique ID of the entity.
  
**`type`** &nbsp; const char*  
*_Null_terminated_*  
  
Entity type. See [Available built-in entity types](/gaming/playfab/features/data/entities/available-built-in-entity-types).
  
Player entities are typically the `title_player_account` type. For more information, see [Available built-in entity types](/gaming/playfab/features/data/entities/available-built-in-entity-types).

## Remarks

For more information about entities, see [Entity Programming Model](/gaming/playfab/features/data/entities/).
  
## Requirements  

**Header:** PFEntityKey.h
