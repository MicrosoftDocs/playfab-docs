---
author: jasonsandlin
title: "PFStatisticColumn"
description: "PFStatisticColumn data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFStatisticColumn  

PFStatisticColumn data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticColumn {  
    PFStatisticAggregationMethod aggregationMethod;  
    const char* name;  
} PFStatisticColumn;  
```
  
### Members  
  
**`aggregationMethod`** &nbsp; [PFStatisticAggregationMethod](../enums/pfstatisticaggregationmethod.md)  
  
Aggregation method for calculating new value of a statistic.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the statistic column, as originally configured.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
