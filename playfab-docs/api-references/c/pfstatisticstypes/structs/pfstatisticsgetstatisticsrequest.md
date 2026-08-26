---
author: jasonsandlin
title: "PFStatisticsGetStatisticsRequest"
description: "PFStatisticsGetStatisticsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsGetStatisticsRequest  

PFStatisticsGetStatisticsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsGetStatisticsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* const* statisticNames;  
    uint32_t statisticNamesCount;  
} PFStatisticsGetStatisticsRequest;  
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
  
**`statisticNames`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) The list of statistics to return for the user. If set to null, the current version of all statistics are returned.
  
**`statisticNamesCount`** &nbsp; uint32_t  
  
Count of statisticNames
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
