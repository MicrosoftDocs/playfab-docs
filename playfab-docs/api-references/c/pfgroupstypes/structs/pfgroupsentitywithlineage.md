---
author: jasonsandlin
title: "PFGroupsEntityWithLineage"
description: "PFGroupsEntityWithLineage data model. Entity wrapper class that contains the entity key and the entities that make up the lineage of the entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsEntityWithLineage  

PFGroupsEntityWithLineage data model. Entity wrapper class that contains the entity key and the entities that make up the lineage of the entity.  

## Syntax  
  
```cpp
typedef struct PFGroupsEntityWithLineage {  
    PFEntityKey const* key;  
    PFEntityKeyDictionaryEntry const* lineage;  
    uint32_t lineageCount;  
} PFGroupsEntityWithLineage;  
```
  
### Members  
  
**`key`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity key for the specified entity.
  
**`lineage`** &nbsp; [PFEntityKeyDictionaryEntry](../../pftypes/structs/pfentitykeydictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) Dictionary of entity keys for related entities. Dictionary key is entity type.
  
**`lineageCount`** &nbsp; uint32_t  
  
Count of lineage
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
