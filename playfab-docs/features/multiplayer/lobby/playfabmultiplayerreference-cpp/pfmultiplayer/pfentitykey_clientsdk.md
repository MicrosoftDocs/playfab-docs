---
author: ScottMunroMS
title: "PFEntityKey - Client SDK"
description: "PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
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
  
Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types.
  
Player entities are typically the ```title_player_account``` type. For more information, see See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types.
  
## Remarks  
  
For more information about entities, see https://docs.microsoft.com/gaming/playfab/features/data/entities/.
  
## Requirements  
  
**Header:** PFEntityKey.h

  
  
