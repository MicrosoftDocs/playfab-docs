---
author: jasonsandlin
title: "PFGroupsEntityWithLineage"
description: "PFGroupsEntityWithLineage data model. Entity wrapper class that contains the entity key and the entities that make up the lineage of the entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsEntityWithLineage  

PFGroupsEntityWithLineage data model. Entity wrapper class that contains the entity key and the entities that make up the lineage of the entity.  

## Syntax  
  
```cpp
typedef struct PFGroupsEntityWithLineage {  
    PFEntityKey const* key;  
    uint32_t lineageCount;  
} PFGroupsEntityWithLineage;  
```
  
### Members  
  
**`key`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity key for the specified entity.
  
**`lineageCount`** &nbsp; uint32_t  
*array of size `lineageCount`*  
  
(Optional) Dictionary of entity keys for related entities. Dictionary key is entity type.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
