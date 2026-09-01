---
author: jasonsandlin
title: "PFStatisticsStatisticColumn"
description: "PFStatisticsStatisticColumn data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsStatisticColumn  

PFStatisticsStatisticColumn data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsStatisticColumn {  
    PFStatisticsStatisticAggregationMethod aggregationMethod;  
    const char* name;  
} PFStatisticsStatisticColumn;  
```
  
### Members  
  
**`aggregationMethod`** &nbsp; [PFStatisticsStatisticAggregationMethod](../enums/pfstatisticsstatisticaggregationmethod.md)  
  
Aggregation method for calculating new value of a statistic.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the statistic column, as originally configured.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
