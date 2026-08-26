---
author: jasonsandlin
title: "PFStatisticsGetStatisticsResponse"
description: "PFStatisticsGetStatisticsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsResponse  

PFStatisticsGetStatisticsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsGetStatisticsResponse {  
    PFStatisticsStatisticColumnCollectionDictionaryEntry const* columnDetails;  
    uint32_t columnDetailsCount;  
    PFEntityKey const* entity;  
    PFStatisticsEntityStatisticValueDictionaryEntry const* statistics;  
    uint32_t statisticsCount;  
} PFStatisticsGetStatisticsResponse;  
```
  
### Members  
  
**`columnDetails`** &nbsp; PFStatisticsStatisticColumnCollectionDictionaryEntry const*  
*may be nullptr*  
  
(Optional) A mapping of statistic name to the columns defined in the corresponding definition.
  
**`columnDetailsCount`** &nbsp; uint32_t  
  
Count of columnDetails
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`statistics`** &nbsp; PFStatisticsEntityStatisticValueDictionaryEntry const*  
*may be nullptr*  
  
(Optional) List of statistics keyed by Name. Only the latest version of a statistic is returned.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
