---
author: jasonsandlin
title: "PFStatisticsUpdateStatisticsRequest"
description: "PFStatisticsUpdateStatisticsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsUpdateStatisticsRequest  

PFStatisticsUpdateStatisticsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsUpdateStatisticsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFStatisticsStatisticUpdate const* statistics;  
    uint32_t statisticsCount;  
    const char* transactionId;  
} PFStatisticsUpdateStatisticsRequest;  
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
  
**`statistics`** &nbsp; [PFStatisticsStatisticUpdate](pfstatisticsstatisticupdate.md) const*  
  
Collection of statistics to update, maximum 50.
  
**`statisticsCount`** &nbsp; uint32_t  
  
Count of statistics
  
**`transactionId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional transactionId of this update which can be used to ensure idempotence.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
