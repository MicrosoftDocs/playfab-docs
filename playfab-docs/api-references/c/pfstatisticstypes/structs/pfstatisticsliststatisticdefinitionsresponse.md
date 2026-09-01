---
author: jasonsandlin
title: "PFStatisticsListStatisticDefinitionsResponse"
description: "PFStatisticsListStatisticDefinitionsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsListStatisticDefinitionsResponse  

PFStatisticsListStatisticDefinitionsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsListStatisticDefinitionsResponse {  
    int32_t pageSize;  
    const char* skipToken;  
    PFStatisticsStatisticDefinition const* statisticDefinitions;  
    uint32_t statisticDefinitionsCount;  
} PFStatisticsListStatisticDefinitionsResponse;  
```
  
### Members  
  
**`pageSize`** &nbsp; int32_t  
  
The page size on the response.
  
**`skipToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The skip token for the paged response.
  
**`statisticDefinitions`** &nbsp; [PFStatisticsStatisticDefinition](pfstatisticsstatisticdefinition.md) const*  
*may be nullptr*  
  
(Optional) List of statistic definitions for the title.
  
**`statisticDefinitionsCount`** &nbsp; uint32_t  
  
Count of statisticDefinitions
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
