---
author: jasonsandlin
title: "PFStatisticsStatisticUpdate"
description: "PFStatisticsStatisticUpdate data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFStatisticsStatisticUpdate  

PFStatisticsStatisticUpdate data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsStatisticUpdate {  
    PFEntityKey const* aggregationTargetEntityKeys;  
    uint32_t aggregationTargetEntityKeysCount;  
    const char* metadata;  
    const char* name;  
    const char* const* scores;  
    uint32_t scoresCount;  
    uint32_t const* version;  
} PFStatisticsStatisticUpdate;  
```
  
### Members  
  
**`aggregationTargetEntityKeys`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) A list of entities to which the statistic update must be aggregated to, in addition to the entity being updated. For example, for Group stats where the stat value is aggregated based on the group members, this would refer to the Group entity. For a community stat that's aggregated at the Title, it is not required to populate this property (Title is the default).
  
**`aggregationTargetEntityKeysCount`** &nbsp; uint32_t  
  
Count of aggregationTargetEntityKeys
  
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

  
  
