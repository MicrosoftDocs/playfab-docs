---
author: jasonsandlin
title: "PFSegmentsPlayerStatistic"
description: "PFSegmentsPlayerStatistic data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFSegmentsPlayerStatistic  

PFSegmentsPlayerStatistic data model.  

## Syntax  
  
```cpp
typedef struct PFSegmentsPlayerStatistic {  
    const char* id;  
    const char* name;  
    int32_t statisticValue;  
    int32_t statisticVersion;  
} PFSegmentsPlayerStatistic;  
```
  
### Members  
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic ID.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Statistic name.
  
**`statisticValue`** &nbsp; int32_t  
  
Current statistic value.
  
**`statisticVersion`** &nbsp; int32_t  
  
Statistic version (0 if not a versioned statistic).
  
  
## Requirements  
  
**Header:** PFSegmentsTypes.h
  
## See also  
[PFSegmentsTypes members](../pfsegmentstypes_members.md)  

  
  
