---
author: jasonsandlin
title: "PFStatisticsStatisticUpdate"
description: "PFStatisticsStatisticUpdate data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsStatisticUpdate  

PFStatisticsStatisticUpdate data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsStatisticUpdate {  
    const char* metadata;  
    const char* name;  
    const char* const* scores;  
    uint32_t scoresCount;  
    uint32_t const* version;  
} PFStatisticsStatisticUpdate;  
```
  
### Members  
  
**`metadata`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Arbitrary metadata to store along side the statistic, will be returned by all Leaderboard APIs.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the statistic, as originally configured.
  
**`scores`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Statistic scores for the entity. This will be used in accordance with the aggregation method configured for the statistics.The maximum value allowed for each individual score is 9223372036854775807. The minimum value for each individual score is -9223372036854775807The values are formatted as strings to avoid interop issues with client libraries unable to handle 64bit integers.
  
**`scoresCount`** &nbsp; uint32_t  
  
Count of scores
  
**`version`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Optional field to indicate the version of the statistic to set. When empty defaults to the statistic's current version.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
