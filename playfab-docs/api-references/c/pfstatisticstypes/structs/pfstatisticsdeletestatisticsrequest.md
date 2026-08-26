---
author: jasonsandlin
title: "PFStatisticsDeleteStatisticsRequest"
description: "PFStatisticsDeleteStatisticsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsDeleteStatisticsRequest  

PFStatisticsDeleteStatisticsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsDeleteStatisticsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFStatisticsStatisticDelete const* statistics;  
    uint32_t statisticsCount;  
} PFStatisticsDeleteStatisticsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`statistics`** &nbsp; [PFStatisticsStatisticDelete](pfstatisticsstatisticdelete.md) const*  
  
Collection of statistics to remove from this entity.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
