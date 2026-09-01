---
author: jasonsandlin
title: "PFStatisticsStatisticColumnCollection"
description: "PFStatisticsStatisticColumnCollection data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsStatisticColumnCollection  

PFStatisticsStatisticColumnCollection data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsStatisticColumnCollection {  
    PFStatisticsStatisticColumn const* columns;  
    uint32_t columnsCount;  
} PFStatisticsStatisticColumnCollection;  
```
  
### Members  
  
**`columns`** &nbsp; [PFStatisticsStatisticColumn](pfstatisticsstatisticcolumn.md) const*  
*may be nullptr*  
  
(Optional) Columns for the statistic defining the aggregation method for each column.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
