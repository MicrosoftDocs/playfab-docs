---
author: jasonsandlin
title: "PFProfilesEntityStatisticValue"
description: "PFProfilesEntityStatisticValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFProfilesEntityStatisticValue  

PFProfilesEntityStatisticValue data model.  

## Syntax  
  
```cpp
typedef struct PFProfilesEntityStatisticValue {  
    PFProfilesEntityStatisticAttributeValueDictionaryEntry const* attributeStatistics;  
    uint32_t attributeStatisticsCount;  
    const char* metadata;  
    const char* name;  
    const char* const* scores;  
    uint32_t scoresCount;  
    int32_t const* value;  
    int32_t version;  
} PFProfilesEntityStatisticValue;  
```
  
### Members  
  
**`attributeStatistics`** &nbsp; PFProfilesEntityStatisticAttributeValueDictionaryEntry const*  
*may be nullptr*  
  
(Optional) Attribute Statistic values.
  
**`attributeStatisticsCount`** &nbsp; uint32_t  
  
Count of attributeStatistics
  
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
  
**`value`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Statistic value.
  
**`version`** &nbsp; int32_t  
  
Statistic version.
  
  
## Requirements  
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
