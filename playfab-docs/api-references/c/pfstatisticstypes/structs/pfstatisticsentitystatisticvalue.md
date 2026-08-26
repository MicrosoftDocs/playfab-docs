---
author: jasonsandlin
title: "PFStatisticsEntityStatisticValue"
description: "PFStatisticsEntityStatisticValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsEntityStatisticValue  

PFStatisticsEntityStatisticValue data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsEntityStatisticValue {  
    const char* metadata;  
    const char* name;  
    const char* const* scores;  
    uint32_t scoresCount;  
    int32_t version;  
} PFStatisticsEntityStatisticValue;  
```
  
### Members  
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Metadata associated with the Statistic.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic name.
  
**`scores`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Statistic scores.
  
**`scoresCount`** &nbsp; uint32_t  
  
Count of scores
  
**`version`** &nbsp; int32_t  
  
Statistic version.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
