---
author: jasonsandlin
title: "PFEntityStatisticValue"
description: "PFEntityStatisticValue data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFEntityStatisticValue  

PFEntityStatisticValue data model.  

## Syntax  
  
```cpp
typedef struct PFEntityStatisticValue {  
    const char* metadata;  
    const char* name;  
    const char* const* scores;  
    uint32_t scoresCount;  
    int32_t version;  
} PFEntityStatisticValue;  
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
  
**Header:** PFProfilesTypes.h
  
## See also  
[PFProfilesTypes members](../pfprofilestypes_members.md)  

  
  
