---
author: jasonsandlin
title: "PFProfilesEntityStatisticValue"
description: "PFProfilesEntityStatisticValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFProfilesEntityStatisticValue  

PFProfilesEntityStatisticValue data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityStatisticValue {  
    PFProfilesEntityStatisticChildValueDictionaryEntry const* childStatistics;  
    uint32_t childStatisticsCount;  
    const char* metadata;  
    const char* name;  
    int32_t const* value;  
    int32_t version;  
} PFProfilesEntityStatisticValue;  
```
  
### Members  
  
**`childStatistics`** &nbsp; PFProfilesEntityStatisticChildValueDictionaryEntry const*  
*may be nullptr*  
  
(Optional) Child statistic values.
  
**`childStatisticsCount`** &nbsp; uint32_t  
  
Count of childStatistics
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic metadata.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic name.
  
**`value`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Statistic value.
  
**`version`** &nbsp; int32_t  
  
Statistic version.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
