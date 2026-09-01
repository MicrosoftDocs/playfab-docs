---
author: jasonsandlin
title: "PFStatisticsGetStatisticsForEntitiesResponse"
description: "PFStatisticsGetStatisticsForEntitiesResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsForEntitiesResponse  

PFStatisticsGetStatisticsForEntitiesResponse data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsGetStatisticsForEntitiesResponse {  
    PFStatisticsStatisticColumnCollectionDictionaryEntry const* columnDetails;  
    uint32_t columnDetailsCount;  
    PFStatisticsEntityStatistics const* entitiesStatistics;  
    uint32_t entitiesStatisticsCount;  
} PFStatisticsGetStatisticsForEntitiesResponse;  
```
  
### Members  
  
**`columnDetails`** &nbsp; PFStatisticsStatisticColumnCollectionDictionaryEntry const*  
*may be nullptr*  
  
(Optional) A mapping of statistic name to the columns defined in the corresponding definition.
  
**`columnDetailsCount`** &nbsp; uint32_t  
  
Count of columnDetails
  
**`entitiesStatistics`** &nbsp; [PFStatisticsEntityStatistics](pfstatisticsentitystatistics.md) const*  
*may be nullptr*  
  
(Optional) List of entities mapped to their statistics. Only the latest version of a statistic is returned.
  
**`entitiesStatisticsCount`** &nbsp; uint32_t  
  
Count of entitiesStatistics
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
