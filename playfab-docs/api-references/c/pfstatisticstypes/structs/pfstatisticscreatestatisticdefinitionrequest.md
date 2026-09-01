---
author: jasonsandlin
title: "PFStatisticsCreateStatisticDefinitionRequest"
description: "PFStatisticsCreateStatisticDefinitionRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFStatisticsCreateStatisticDefinitionRequest  

PFStatisticsCreateStatisticDefinitionRequest data model.  

## Syntax  
  
```cpp
typedef struct PFStatisticsCreateStatisticDefinitionRequest {  
    const char* const* aggregationSources;  
    uint32_t aggregationSourcesCount;  
    PFStatisticsStatisticColumn const* columns;  
    uint32_t columnsCount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* entityType;  
    PFStatisticsStatisticsEventEmissionConfig const* eventEmissionConfig;  
    const char* name;  
    PFVersionConfiguration const* versionConfiguration;  
} PFStatisticsCreateStatisticDefinitionRequest;  
```
  
### Members  
  
**`aggregationSources`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) [In Preview]: The list of statistic definition names whose scores must be aggregated towards this stat. If AggregationSource is specified, the entityType of this definition MUST be Title (making it a CommunityStat). Currently, only one aggregation source can be specified.
  
**`aggregationSourcesCount`** &nbsp; uint32_t  
  
Count of aggregationSources
  
**`columns`** &nbsp; [PFStatisticsStatisticColumn](pfstatisticsstatisticcolumn.md) const*  
*may be nullptr*  
  
(Optional) The columns for the statistic defining the aggregation method for each column. A maximum of 5 columns are allowed.
  
**`columnsCount`** &nbsp; uint32_t  
  
Count of columns
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entityType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The entity type allowed to have score(s) for this statistic.
  
**`eventEmissionConfig`** &nbsp; [PFStatisticsStatisticsEventEmissionConfig](pfstatisticsstatisticseventemissionconfig.md) const*  
*may be nullptr*  
  
(Optional) [In Preview]: Configurations for different Statistics events that can be emitted by the service.
  
**`name`** &nbsp; const char*  
*is null-terminated*  
  
Name of the statistic. Must be less than 150 characters. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.
  
**`versionConfiguration`** &nbsp; PFVersionConfiguration const*  
*may be nullptr*  
  
(Optional) The version reset configuration for the statistic definition.
  
  
## Requirements  
  
**Header:** PFStatisticsTypes.h
  
## See also  
[PFStatisticsTypes members](../pfstatisticstypes_members.md)  

  
  
