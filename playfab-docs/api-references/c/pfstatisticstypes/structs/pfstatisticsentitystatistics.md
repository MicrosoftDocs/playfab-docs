---
author: jasonsandlin
title: "PFStatisticsEntityStatistics"
description: "PFStatisticsEntityStatistics data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsEntityStatistics  

PFStatisticsEntityStatistics data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsEntityStatistics {  
    PFEntityKey const* entityKey;  
    PFStatisticsEntityStatisticValue const* statistics;  
    uint32_t statisticsCount;  
} PFStatisticsEntityStatistics;  
```
  
### Members  
  
**`entityKey`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity for which the statistics are returned.
  
**`statistics`** &nbsp; [PFStatisticsEntityStatisticValue](pfstatisticsentitystatisticvalue.md) const*  
*may be nullptr*  
  
(Optional) The statistics for the given entity key.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
