---
author: jasonsandlin
title: "PFStatisticsGetStatisticsForEntitiesRequest"
description: "PFStatisticsGetStatisticsForEntitiesRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsForEntitiesRequest  

PFStatisticsGetStatisticsForEntitiesRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsGetStatisticsForEntitiesRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entities;  
    uint32_t entitiesCount;  
    const char* const* statisticNames;  
    uint32_t statisticNamesCount;  
} PFStatisticsGetStatisticsForEntitiesRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entities`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
Collection of Entity IDs to retrieve statistics for.
  
**`entitiesCount`** &nbsp; uint32_t  
  
Count of entities
  
**`statisticNames`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of statistics to return for the user. If set to null, the current version of all statistics are returned.
  
**`statisticNamesCount`** &nbsp; uint32_t  
  
Count of statisticNames
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
