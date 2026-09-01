---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticsResponse"
description: "PFStatisticsUpdateStatisticsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticsResponse  

PFStatisticsUpdateStatisticsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsUpdateStatisticsResponse {  
    PFStatisticsStatisticColumnCollectionDictionaryEntry const* columnDetails;  
    uint32_t columnDetailsCount;  
    PFEntityKey const* entity;  
    PFStatisticsEntityStatisticValueDictionaryEntry const* statistics;  
    uint32_t statisticsCount;  
} PFStatisticsUpdateStatisticsResponse;  
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
  
(Optional) Updated entity profile statistics.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
