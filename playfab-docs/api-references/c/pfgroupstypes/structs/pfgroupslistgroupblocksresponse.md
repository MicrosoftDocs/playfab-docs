---
author: jasonsandlin
title: "PFGroupsListGroupBlocksResponse"
description: "PFGroupsListGroupBlocksResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFGroupsListGroupBlocksResponse  

PFGroupsListGroupBlocksResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupBlocksResponse {  
    PFGroupsGroupBlock const* blockedEntities;  
    uint32_t blockedEntitiesCount;  
} PFGroupsListGroupBlocksResponse;  
```
  
### Members  
  
**`blockedEntities`** &nbsp; [PFGroupsGroupBlock](pfgroupsgroupblock.md) const*  
*may be nullptr*  
  
(Optional) The requested list blocked entities.
  
**`blockedEntitiesCount`** &nbsp; uint32_t  
  
Count of blockedEntities
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
